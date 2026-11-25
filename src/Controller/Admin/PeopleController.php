<?php
declare(strict_types=1);

namespace App\Controller\Admin;

use App\Controller\Admin\AppController;
use App\Utility\CrudIndexSearch;

/**
 * People Controller
 *
 * @property \App\Model\Table\PeopleTable $People
 */
class PeopleController extends AppController
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

        $query = $this->People->find()
            ->contain(['Clubs', 'Countries']);

        $search = trim((string)$this->request->getQuery('search', ''));
        if ($search !== '') {
            $query->leftJoinWith('Clubs')->leftJoinWith('Countries');
            CrudIndexSearch::apply($query, $search, [
                'People.first_name',
                'People.last_name',
                'People.phone',
                'People.email1',
                'People.email2',
                'Clubs.name',
                'Countries.code',
                'Countries.short_name_en',
            ], [
                'People.access_id',
            ], 'People.id');
        }

        $people = $this->paginate($query);

        $this->set(compact('people'));
    }

    /**
     * View method
     *
     * @param string|null $id Person id.
     * @return \Cake\Http\Response|null|void Renders view
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id = null)
    {
        $this->rememberLastRecord($id);

        $person = $this->People->get($id, contain: ['Clubs', 'Countries', 'Registrations']);
        //dd($id);
        //dd($person->toArray());
        $clubs = $this->People->Clubs->find('list', limit: 200)->all();
        $countries = $this->People->Countries->find('list', limit: 200)->all();
        $this->set(compact('person', 'clubs', 'countries'));
    }

    /**
     * Add method
     *
     * @return \Cake\Http\Response|null|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $person = $this->People->newEmptyEntity();
        if ($this->request->is('post')) {
            $data = $this->request->getData();
            //dd($data);
            $person = $this->People->patchEntity($person, $data);
            //dd($person->toArray());
            //dd($person->getErrors());
            if ($this->People->save($person)) {
                $this->Flash->success(__('The person has been saved.'));
                $this->rememberLastRecord($person->id);

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The person could not be saved. Please, try again.'));
        }
        $clubs = $this->People->Clubs->find('list', limit: 200)->all();
        $countries = $this->People->Countries->find('list', limit: 200)->all();
        $this->set(compact('person', 'clubs', 'countries'));
    }

    /**
     * Edit method
     *
     * @param string|null $id Person id.
     * @return \Cake\Http\Response|null|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $this->rememberLastRecord($id);

        $person = $this->People->get($id, contain: []);
        if ($this->request->is(['patch', 'post', 'put'])) {
            $data = $this->request->getData();
            //dd($data);
            $person = $this->People->patchEntity($person, $data);
            //dd($person->toArray());
            //dd($person->getErrors());
            if ($this->People->save($person)) {
                $this->Flash->success(__('The person has been saved.'));

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The person could not be saved. Please, try again.'));
        }
        $clubs = $this->People->Clubs->find('list', limit: 200)->all();
        $countries = $this->People->Countries->find('list', limit: 200)->all();
        $this->set(compact('person', 'clubs', 'countries'));
    }

    /**
     * Delete method
     *
     * @param string|null $id Person id.
     * @return \Cake\Http\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['post', 'delete']);
        $person = $this->People->get($id);
        foreach ($person->toArray() as $field => $value) {
            if (is_string($field) && str_ends_with($field, '_count') && (int)$value > 0) {
                $this->Flash->error(__('Cannot delete: related records exist'));

                return $this->redirect(['action' => 'index']);
            }
        }
        if ($this->People->delete($person)) {
            $this->Flash->success(__('The person has been deleted.'));
        } else {
            $this->Flash->error(__('The person could not be deleted. Please, try again.'));
        }

        return $this->redirect(['action' => 'index']);
    }
}
