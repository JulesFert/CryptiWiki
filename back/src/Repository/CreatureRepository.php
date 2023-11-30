<?php

namespace App\Repository;

use App\Entity\Creature;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\EntityManager;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Creature>
 *
 * @method Creature|null find($id, $lockMode = null, $lockVersion = null)
 * @method Creature|null findOneBy(array $criteria, array $orderBy = null)
 * @method Creature[]    findAll()
 * @method Creature[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CreatureRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Creature::class);
    }

    public function add(Creature $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(Creature $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    /**
     * Cette fonction du repository permet de chercher une créature
     * au hasard dans la base
     *
     * @return array
     */
    public function getOneRandomCreature()
    {
        // Récupération de la connection database
        $connection = $this->getEntityManager()->getConnection();

        // Select d'une créature au hasard (classement random) +
        // LIMIT 1
        $query = "SELECT id 
            FROM creature
            WHERE created_at <> (SELECT MAX(created_at) FROM creature) AND is_valid = true
            ORDER BY RAND()
            LIMIT 1

        ";

        // On retourne le creature séléctionné
        $result = $connection->executeQuery($query);

        return $result->fetchAssociative();
    }

    //fonction qui permet de récupérer la dernière créature créer

     /**
     * Cette fonction du repository permet de chercher la dernière créature créer dans la base
     *
     * @return array
     */
    public function getLastCreatedId()
    {
        // Récupération de la connection database
        $connection = $this->getEntityManager()->getConnection();

        // Select de la dernière créature créée  +
        // LIMIT 1
        $query = "SELECT id FROM creature
        WHERE is_valid = true
        ORDER BY creature.created_at DESC
        LIMIT 1
        ";

        // On retourne le creature séléctionné
        $result = $connection->executeQuery($query);

        return $result->fetchAssociative();
    }

     /**
     * Cette fonction du repository permet de chercher un ou plusieurs créature avec la barre de recherche 
     * Methode DQL
     * @return array
     */
    public function searchCreatures($searchTerm = null)
    {
        // Récupération de la connection database
        $em = $this->getEntityManager();

        // Select de la dernière créature créée  +
        // LIMIT 1
        $query = $em->createQuery( 
            "SELECT c
            FROM \App\Entity\Creature c
            WHERE c.name LIKE :searchTerm AND c.isValid = true
            ORDER BY c.id ASC"
            )->setParameter('searchTerm', '%' . $searchTerm . '%');
      
            return $query->getResult();
    }

    /**
     * Cette fonction du repository permet de chercher le plus grand code_creature de la base 
     * Methode DQL
     * @return array
     */
    public function getMaxCodeCreature()
    {
      // Récupération de la connection database
      $connection = $this->getEntityManager()->getConnection();

      $query = "SELECT MAX(code_creature) AS maxCode
                FROM `creature`";

      // On retourne le creature séléctionné
      $result = $connection->executeQuery($query);

      return $result->fetchAssociative();
    }
}

      /**
     * Recherche de créatures
     *
     *  Methode Query Builder
     */
//     public function searchCreatures(?string $searchTerm = null): array
//     {
//         $queryBuilder = $this->createQueryBuilder('c');

//         if ($searchTerm !== null) {
//             $queryBuilder->where('c.name LIKE :searchTerm')
//                 ->setParameter('searchTerm', '%' . $searchTerm . '%');
//         }
//     // Permet de récupérer les resultats 
//         $query = $queryBuilder->getQuery();

//         return $query->getResult();
//     }
// }
//    /**
//     * @return Creature[] Returns an array of Creature objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('c')
//            ->andWhere('c.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('c.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?Creature
//    {
//        return $this->createQueryBuilder('c')
//            ->andWhere('c.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }

