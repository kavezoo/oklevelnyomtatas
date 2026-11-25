<?php
declare(strict_types=1);

namespace App\Controller;

use App\Controller\Admin\PeopleController as AdminPeopleController;
use Cake\Event\EventInterface;

class PeopleController extends AdminPeopleController
{
    public function initialize(): void
    {
        parent::initialize();
        $this->viewBuilder()->setTemplatePath('Admin' . DS . 'People');
    }

    public function beforeRender(EventInterface $event): void
    {
        parent::beforeRender($event);
        $this->viewBuilder()->setTemplatePath('Admin' . DS . 'People');
    }
}