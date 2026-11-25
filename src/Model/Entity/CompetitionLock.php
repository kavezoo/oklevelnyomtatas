<?php
declare(strict_types=1);

namespace App\Model\Entity;

use Cake\ORM\Entity;

class CompetitionLock extends Entity
{
    protected array $_accessible = [
        'access_id' => true,
        'competition_id' => true,
        'max_team_number' => true,
        'max_table_number' => true,
        'max_registration_number' => true,
        'max_competition_number' => true,
        'created' => true,
        'modified' => true,
        'competition' => true,
    ];
}