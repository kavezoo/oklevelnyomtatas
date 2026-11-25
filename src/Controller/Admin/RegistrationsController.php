<?php
declare(strict_types=1);

namespace App\Controller\Admin;

use App\Controller\Admin\AppController;
use App\Utility\CrudIndexSearch;

/**
 * Registrations Controller
 *
 * @property \App\Model\Table\RegistrationsTable $Registrations
 */
class RegistrationsController extends AppController
{
    /**
     * Index method
     *
     * @return \Cake\Http\Response|null|void Renders view
     */
    public function index()
    {
        // Lapozás — globális: JeffAdmin.paginate.limit / maxLimit (config/paginate.php).
        // Helyi felülírás:
        // $this->paginate['limit'] = 10;
        // $this->paginate['maxLimit'] = 100;

        $this->paginate['limit'] = 100;
        $this->paginate['maxLimit'] = 100;

        $query = $this->Registrations->find()
            ->contain(['Competitions', 'People', 'Clubs', 'Countries', 'Teams']);

        $competitionId = (int)$this->request->getQuery('competition_id');
        if ($competitionId > 0) {
            $query->where(['Registrations.competition_id' => $competitionId]);
        }
        $competitionFilter = $competitionId > 0
            ? $this->Registrations->Competitions->find()->where(['id' => $competitionId])->first()
            : null;

        $search = trim((string)$this->request->getQuery('search', ''));
        if ($search !== '') {
            $query
                ->leftJoinWith('People')
                ->leftJoinWith('Teams')
                ->leftJoinWith('Competitions')
                ->leftJoinWith('Clubs')
                ->leftJoinWith('Countries');
            CrudIndexSearch::apply($query, $search, [
                'People.first_name',
                'People.last_name',
                'Teams.name',
                'Competitions.name',
                'Clubs.name',
                'Countries.code',
                'Countries.short_name_en',
                'Registrations.email',
                'Registrations.disqualification_reason',
                'Registrations.result_time',
            ], [
                'Registrations.access_id',
                'Registrations.registration_number',
                'Registrations.competition_number',
                'Registrations.table_number',
                'Registrations.final_rank',
                'Registrations.final_rank_women',
                'People.access_id',
                'Teams.access_id',
            ], 'Registrations.id');
        }

        $registrations = $this->paginate($query);

        $this->set(compact('registrations', 'competitionId', 'competitionFilter'));
    }

    /**
     * View method
     *
     * @param string|null $id Registration id.
     * @return \Cake\Http\Response|null|void Renders view
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $this->rememberLastRecord($id);

        $registration = $this->Registrations->get($id, contain: ['Competitions', 'People', 'Clubs', 'Countries', 'Teams']);
        //dd($id);
        //dd($registration->toArray());
        $competitions = $this->Registrations->Competitions->find('list', limit: 200)->all();
        $people = $this->Registrations->People->find('list', limit: 200)->all();
        $clubs = $this->Registrations->Clubs->find('list', limit: 200)->all();
        $countries = $this->Registrations->Countries->find('list', limit: 200)->all();
        $teams = $this->Registrations->Teams->find('list', limit: 200)->all();
        $this->set(compact('registration', 'competitions', 'people', 'clubs', 'countries', 'teams'));
    }

    /**
     * Add method
     *
     * @return \Cake\Http\Response|null|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $registration = $this->Registrations->newEmptyEntity();
        if ($this->request->is('post')) {
            $data = $this->request->getData();
            //dd($data);
            $registration = $this->Registrations->patchEntity($registration, $data);
            //dd($registration->toArray());
            //dd($registration->getErrors());
            if ($this->Registrations->save($registration)) {
                $this->Flash->success(__('The registration has been saved.'));
                $this->rememberLastRecord($registration->id);

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The registration could not be saved. Please, try again.'));
        }
        $competitions = $this->Registrations->Competitions->find('list', limit: 200)->all();
        $people = $this->Registrations->People->find('list', limit: 200)->all();
        $clubs = $this->Registrations->Clubs->find('list', limit: 200)->all();
        $countries = $this->Registrations->Countries->find('list', limit: 200)->all();
        $teams = $this->Registrations->Teams->find('list', limit: 200)->all();
        $this->set(compact('registration', 'competitions', 'people', 'clubs', 'countries', 'teams'));
    }

    /**
     * Edit method
     *
     * @param string|null $id Registration id.
     * @return \Cake\Http\Response|null|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $this->rememberLastRecord($id);

        $registration = $this->Registrations->get($id, contain: []);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $data = $this->request->getData();
            //dd($data);
            $registration = $this->Registrations->patchEntity($registration, $data);
            //dd($registration->toArray());
            //dd($registration->getErrors());
            if ($this->Registrations->save($registration)) {
                $this->Flash->success(__('The registration has been saved.'));

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The registration could not be saved. Please, try again.'));
        }
        $competitions = $this->Registrations->Competitions->find('list', limit: 200)->all();
        $people = $this->Registrations->People->find('list', limit: 200)->all();
        $clubs = $this->Registrations->Clubs->find('list', limit: 200)->all();
        $countries = $this->Registrations->Countries->find('list', limit: 200)->all();
        $teams = $this->Registrations->Teams->find('list', limit: 200)->all();
        $this->set(compact('registration', 'competitions', 'people', 'clubs', 'countries', 'teams'));
    }

    /**
     * Delete method
     *
     * @param string|null $id Registration id.
     * @return \Cake\Http\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $registration = $this->Registrations->get($id);
        foreach ($registration->toArray() as $field => $value) {
            if (is_string($field) && str_ends_with($field, '_count') && (int)$value > 0) {
                $this->Flash->error(__('Cannot delete: related records exist'));

                return $this->redirect(['action' => 'index']);
            }
        }
        if ($this->Registrations->delete($registration)) {
            $this->Flash->success(__('The registration has been deleted.'));
        } else {
            $this->Flash->error(__('The registration could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
