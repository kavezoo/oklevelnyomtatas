<?php
declare(strict_types=1);

namespace App\Model\Table;

use Cake\ORM\Table;
use Cake\Validation\Validator;

class TeamsTable extends Table
{
    public function initialize(array $config): void
    {
        parent::initialize($config);

        $this->setTable('teams');
        $this->setDisplayField('name');
        $this->setPrimaryKey('id');

        $this->addBehavior('Timestamp');

        $this->belongsTo('Competitions', ['foreignKey' => 'competition_id']);
        $this->hasMany('Registrations', ['foreignKey' => 'team_id']);
    }

    public function validationDefault(Validator $validator): Validator
    {
        $validator
            ->scalar('name')
            ->maxLength('name', 255)
            ->allowEmptyString('name');

        $validator
            ->integer('access_id')
            ->allowEmptyString('access_id')
            ->add('access_id', 'unique', ['rule' => 'validateUnique', 'provider' => 'table']);

        return $validator;
    }
}