<?php
declare(strict_types=1);

namespace App\Controller\Admin;

use App\Controller\Admin\AppController;
use App\Utility\CrudIndexSearch;

/**
 * Teams Controller
 *
 * @property \App\Model\Table\TeamsTable $Teams
 */
class TeamsController extends AppController
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

        $query = $this->Teams->find()
            ->contain(['Competitions']);

        $competitionId = (int)$this->request->getQuery('competition_id');
        if ($competitionId > 0) {
            $query->where(['Teams.competition_id' => $competitionId]);
        }
        $competitionFilter = $competitionId > 0
            ? $this->Teams->Competitions->find()->where(['id' => $competitionId])->first()
            : null;

        $search = trim((string)$this->request->getQuery('search', ''));
        if ($search !== '') {
            $query->leftJoinWith('Competitions');
            CrudIndexSearch::apply($query, $search, [
                'Teams.name',
                'Competitions.name',
            ], [
                'Teams.access_id',
                'Teams.order_number',
                'Teams.final_rank',
                'Teams.competition_id',
            ], 'Teams.id');
        }

        $teams = $this->paginate($query);

        $this->set(compact('teams', 'competitionId', 'competitionFilter'));
    }

    /**
     * View method
     *
     * @param string|null $id Team id.
     * @return \Cake\Http\Response|null|void Renders view
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $this->rememberLastRecord($id);

        $team = $this->Teams->get($id, contain: ['Competitions', 'Registrations']);
        //dd($id);
        //dd($team->toArray());
        $competitions = $this->Teams->Competitions->find('list', limit: 200)->all();
        $this->set(compact('team', 'competitions'));
    }

    /**
     * Add method
     *
     * @return \Cake\Http\Response|null|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $team = $this->Teams->newEmptyEntity();
        if ($this->request->is('post')) {
            $data = $this->request->getData();
            //dd($data);
            $team = $this->Teams->patchEntity($team, $data);
            //dd($team->toArray());
            //dd($team->getErrors());
            if ($this->Teams->save($team)) {
                $this->Flash->success(__('The team has been saved.'));
                $this->rememberLastRecord($team->id);

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The team could not be saved. Please, try again.'));
        }
        $competitions = $this->Teams->Competitions->find('list', limit: 200)->all();
        $this->set(compact('team', 'competitions'));
    }

    /**
     * Edit method
     *
     * @param string|null $id Team id.
     * @return \Cake\Http\Response|null|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $this->rememberLastRecord($id);

        $team = $this->Teams->get($id, contain: []);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $data = $this->request->getData();
            //dd($data);
            $team = $this->Teams->patchEntity($team, $data);
            //dd($team->toArray());
            //dd($team->getErrors());
            if ($this->Teams->save($team)) {
                $this->Flash->success(__('The team has been saved.'));

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The team could not be saved. Please, try again.'));
        }
        $competitions = $this->Teams->Competitions->find('list', limit: 200)->all();
        $this->set(compact('team', 'competitions'));
    }

    /**
     * Delete method
     *
     * @param string|null $id Team id.
     * @return \Cake\Http\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $team = $this->Teams->get($id);
        foreach ($team->toArray() as $field => $value) {
            if (is_string($field) && str_ends_with($field, '_count') && (int)$value > 0) {
                $this->Flash->error(__('Cannot delete: related records exist'));

                return $this->redirect(['action' => 'index']);
            }
        }
        if ($this->Teams->delete($team)) {
            $this->Flash->success(__('The team has been deleted.'));
        } else {
            $this->Flash->error(__('The team could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
