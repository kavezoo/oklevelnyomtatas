<?php
declare(strict_types=1);

namespace App\Model\Entity;

use Cake\ORM\Entity;

class Team extends Entity
{
    protected array $_accessible = [
        'access_id' => true,
        'competition_id' => true,
        'name' => true,
        'order_number' => true,
        'is_qualified' => true,
        'final_rank' => true,
        'result_time' => true,
        'contestant_c1' => true,
        'contestant_c2' => true,
        'contestant_c3' => true,
        'created' => true,
        'modified' => true,
        'competition' => true,
        'registrations' => true,
    ];
}