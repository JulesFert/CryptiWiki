<?php

namespace App\Entity;

use App\Repository\HabitatRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Serializer\Annotation\Ignore;

/**
 * @ORM\Entity(repositoryClass=HabitatRepository::class)
 */
class Habitat
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue

     * @Groups({"get_item", "get_collection"})
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     * @Groups({"get_item", "get_collection"})
     */
    private $name;

    /**
     * @ORM\ManyToMany(targetEntity=Creature::class, mappedBy="habitats")
     * @Ignore() *
     */
    private $creatures;

    public function __construct()
    {
        $this->creatures = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    /**
     * @return Collection<int, Creature>
     */
    public function getCreatures(): Collection
    {
        return $this->creatures;
    }

    public function addCreature(Creature $creature): self
    {
        if (!$this->creatures->contains($creature)) {
            $this->creatures[] = $creature;
            $creature->addHabitats($this);
        }

        return $this;
    }

    public function removeCreature(Creature $creature): self
    {
        if ($this->creatures->removeElement($creature)) {
            $creature->removeHabitats($this);
        }

        return $this;
    }


    public function __toString()
    {
        return $this->name;
    }
}
