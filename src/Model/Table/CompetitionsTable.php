<?php
declare(strict_types=1);

namespace App\Model\Table;

use Cake\ORM\Table;
use Cake\Validation\Validator;

class CompetitionsTable extends Table
{
    public function initialize(array $config): void
    {
        parent::initialize($config);

        $this->setTable('competitions');
        $this->setDisplayField('name');
        $this->setPrimaryKey('id');

        $this->addBehavior('Timestamp');

        $this->belongsTo('VlIndividuals', [
            'className' => 'Competitions',
            'foreignKey' => 'vl_individuals_id',
            'propertyName' => 'vl_individual',
        ]);
        $this->belongsTo('VlTeams', [
            'className' => 'Competitions',
            'foreignKey' => 'vl_teams_id',
            'propertyName' => 'vl_team',
        ]);
        $this->belongsTo('VlWomen', [
            'className' => 'Competitions',
            'foreignKey' => 'vl_women_id',
            'propertyName' => 'vl_women',
        ]);
        $this->belongsTo('PublishedCompetitions', [
            'className' => 'Competitions',
            'foreignKey' => 'published_competition_id',
            'propertyName' => 'published_competition',
        ]);

        $this->hasMany('Teams', ['foreignKey' => 'competition_id']);
        $this->hasMany('SeatingTables', ['foreignKey' => 'competition_id']);
        $this->hasMany('Registrations', ['foreignKey' => 'competition_id']);
        $this->hasMany('CompetitionLocks', ['foreignKey' => 'competition_id']);
    }

    public function validationDefault(Validator $validator): Validator
    {
        $validator
            ->integer('access_id')
            ->requirePresence('access_id', 'create')
            ->notEmptyString('access_id')
            ->add('access_id', 'unique', ['rule' => 'validateUnique', 'provider' => 'table']);

        return $validator;
    }
}