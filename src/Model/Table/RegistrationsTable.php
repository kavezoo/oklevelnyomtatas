<?php
declare(strict_types=1);

namespace App\Model\Table;

use Cake\ORM\Table;
use Cake\Validation\Validator;

class RegistrationsTable extends Table
{
    public function initialize(array $config): void
    {
        parent::initialize($config);

        $this->setTable('registrations');
        $this->setDisplayField('id');
        $this->setPrimaryKey('id');

        $this->addBehavior('Timestamp');

        $this->belongsTo('Competitions', ['foreignKey' => 'competition_id']);
        $this->belongsTo('People', ['foreignKey' => 'person_id']);
        $this->belongsTo('Clubs', ['foreignKey' => 'club_id']);
        $this->belongsTo('Countries', ['foreignKey' => 'country_id']);
        $this->belongsTo('Teams', ['foreignKey' => 'team_id']);
    }

    public function validationDefault(Validator $validator): Validator
    {
        $validator
            ->integer('access_id')
            ->allowEmptyString('access_id')
            ->add('access_id', 'unique', ['rule' => 'validateUnique', 'provider' => 'table']);

        $validator
            ->integer('competition_id')
            ->allowEmptyString('competition_id');

        $validator
            ->dateTime('result_time')
            ->allowEmptyDateTime('result_time');

        $validator
            ->integer('final_rank')
            ->allowEmptyString('final_rank');

        return $validator;
    }
}