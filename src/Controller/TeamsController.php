<?php
declare(strict_types=1);

namespace App\Controller;

use App\Controller\Admin\TeamsController as AdminTeamsController;
use Cake\Event\EventInterface;

class TeamsController extends AdminTeamsController
{
    public function initialize(): void
    {
        parent::initialize();
        $this->viewBuilder()->setTemplatePath('Admin' . DS . 'Teams');
    }

    public function beforeRender(EventInterface $event): void
    {
        parent::beforeRender($event);
        $this->viewBuilder()->setTemplatePath('Admin' . DS . 'Teams');
    }
}