<?php
declare(strict_types=1);

namespace App\Model\Entity;

use Cake\ORM\Entity;

class SmokeTimerSetting extends Entity
{
    protected array $_accessible = [
        'access_id' => true,
        'database_id' => true,
        'db_version' => true,
        'last_competition_access_id' => true,
        'lock_registrations' => true,
        'use_translation' => true,
        'created' => true,
        'modified' => true,
    ];
}