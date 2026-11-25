<?php
declare(strict_types=1);

namespace App\Model\Entity;

use Cake\ORM\Entity;

class Registration extends Entity
{
    protected array $_accessible = [
        'access_id' => true,
        'competition_id' => true,
        'person_id' => true,
        'club_id' => true,
        'country_id' => true,
        'team_id' => true,
        'registration_number' => true,
        'competition_number' => true,
        'table_number' => true,
        'final_rank' => true,
        'final_rank_women' => true,
        'result_time' => true,
        'fee_amount' => true,
        'email' => true,
        'disqualification_reason' => true,
        'note1' => true,
        'note2' => true,
        'access_last_modified' => true,
        'disqualified' => true,
        'team_scored' => true,
        'team_qualified' => true,
        'team_top3' => true,
        'email_sent' => true,
        'expo' => true,
        'gala' => true,
        'payment_ok' => true,
        'presidents_dinner' => true,
        'present' => true,
        'finished' => true,
        'competing' => true,
        'created' => true,
        'modified' => true,
        'competition' => true,
        'person' => true,
        'club' => true,
        'country' => true,
        'team' => true,
    ];
}