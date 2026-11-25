<?php
declare(strict_types=1);

namespace App\Model\Entity;

use Cake\ORM\Entity;

class SeatingTable extends Entity
{
    protected array $_accessible = [
        'access_id' => true,
        'competition_id' => true,
        'number' => true,
        'seat_count' => true,
        'referee_fixed' => true,
        'created' => true,
        'modified' => true,
        'competition' => true,
    ];
}