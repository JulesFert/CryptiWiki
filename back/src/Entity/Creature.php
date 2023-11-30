<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\Collection;
use Symfony\Component\HttpFoundation\File\File;
use Doctrine\Common\Collections\ArrayCollection;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Serializer\Annotation\Ignore;

use Symfony\Component\Validator\Constraints as Assert;



/**
 * @ORM\Entity(repositoryClass=CreatureRepository::class)
 */
class Creature
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")  
     * @Groups({"get_item", "get_collection"})
     */
    private $id;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Groups({"get_collection", "get_item"})
     */
    private $codeCreature;

    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\NotBlank
     * @Groups({"get_collection", "get_item"})
     */
    private $name;

    /**
     * @ORM\Column(type="text")
     * @Assert\NotBlank
     * @Groups({"get_collection", "get_item"})
     */
    private $resume;

    /**
     * @ORM\Column(type="text")
     * @Assert\NotBlank
     * @Groups({"get_collection", "get_item"})
     */
    private $description;


    /**
     * @var File 
     */
    private $pictureFile;


    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     * @Groups({"get_collection", "get_item"})
     */
    private $picture;

    /**
     * @ORM\Column(type="json", nullable=true)
     * @Assert\NotBlank
     * @Groups({"get_collection", "get_item"})
     */
    private $otherNames = [];

    /**
     * @ORM\ManyToMany(targetEntity=Type::class, inversedBy="creatures")
     * @ORM\JoinColumn(nullable=false)
     * @Assert\NotBlank
     * @Groups({"get_item", "get_collection"})
     */
    private $types;

    /**
     * @ORM\Column(type="json", nullable=true)
     * @Assert\NotBlank
     * @Groups({"get_collection", "get_item"})
     */
    private $relatedCreatures = [];

    /**
     * @ORM\Column(type="string")
     * @Assert\NotBlank
     * @Groups({"get_collection", "get_item"})
     */
    private $size;

    /**
     * @ORM\Column(type="string")
     * @Assert\NotBlank
     * @Groups({"get_collection", "get_item"})
     */
    private $weight;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     * @Assert\NotBlank
     * @Groups({"get_collection", "get_item"})
     */
    private $physicalPeculiarities;

    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\NotBlank
     * @Groups({"get_collection", "get_item"})
     */
    private $diet;

    /**
     * @ORM\ManyToMany(targetEntity=Habitat::class, inversedBy="creatures")
     * @Assert\NotBlank
     * @Groups({"get_item", "get_collection"})
     */
    private $habitats;

    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\NotBlank
     * @Groups({"get_collection", "get_item"})
     */
    private $origin;

    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\NotBlank
     * @Groups({"get_collection", "get_item"})
     */
    private $localisation;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     * @Assert\NotBlank
     * @Groups({"get_collection", "get_item"})
     */
    private $firstMention;
    
    /**
     * @ORM\Column(type="datetime", nullable=true)
     * @Groups({"get_collection", "get_item"})
     */
    private $createdAt;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     * @Groups({"get_item", "get_collection"})
     */
    private $updatedAt;

    /**
     * @ORM\Column(type="boolean")
     */
    private $isValid;

    /**
     * @ORM\Column(type="boolean")
     */
    private $isVisible;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="creatures")
     * @ORM\JoinColumn(nullable=true)
     * @Groups({"get_collection"})
     */
    private $user;
    
    /**
     * @ORM\Column(type="string", length=255, nullable=true, unique=true)
     * @Groups({"get_item", "get_collection"})
     */
    private $slug;

    public function __construct()
    {
        $this->types = new ArrayCollection();
        $this->habitats = new ArrayCollection();
        $this->isValid = false;
        $this->isVisible = false;
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

    public function getResume(): ?string
    {
        return $this->resume;
    }

    public function setResume(string $resume): self
    {
        $this->resume = $resume;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getPicture(): ?string
    {
        return $this->picture;
    }

    public function setPicture(?string $picture): self
    {
        $this->picture = $picture;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function setCreatedAt(\DateTimeInterface $createdAt): self
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeInterface
    {
        return $this->updatedAt;
    }

    public function setUpdatedAt(\DateTimeInterface $updatedAt): self
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }

    public function getSize(): ?string
    {
        return $this->size;
    }

    public function setSize(string $size): self
    {
        $this->size = $size;

        return $this;
    }

    public function getWeight(): ?string
    {
        return $this->weight;
    }

    public function setWeight(string $weight): self
    {
        $this->weight = $weight;

        return $this;
    }

    public function getPhysicalPeculiarities(): ?string
    {
        return $this->physicalPeculiarities;
    }


    public function setPhysicalPeculiarities(?string $physicalPercularities): self
    {
        $this->physicalPeculiarities = $physicalPercularities;


        return $this;
    }

    public function getDiet(): ?string
    {
        return $this->diet;
    }

    public function setDiet(string $diet): self
    {
        $this->diet = $diet;

        return $this;
    }

    public function getOrigin(): ?string
    {
        return $this->origin;
    }

    public function setOrigin(string $origin): self
    {
        $this->origin = $origin;

        return $this;
    }

    public function getLocalisation(): ?string
    {
        return $this->localisation;
    }

    public function setLocalisation(string $localisation): self
    {
        $this->localisation = $localisation;

        return $this;
    }

    public function getFirstMention(): ?string
    {
        return $this->firstMention;
    }

    public function setFirstMention(?string $firstMention): self
    {
        $this->firstMention = $firstMention;

        return $this;
    }

    public function isIsValid(): ?bool
    {
        return $this->isValid;
    }

    public function setIsValid(bool $isValid): self
    {
        $this->isValid = $isValid;

        return $this;
    }

    public function isIsVisible(): ?bool
    {
        return $this->isVisible;
    }

    public function setIsVisible(bool $isVisible): self
    {
        $this->isVisible = $isVisible;

        return $this;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(?User $user): self
    {
        $this->user = $user;

        return $this;
    }

    /**
     * @return Collection<int, Type>
     * @Groups({"get_item"})
     */
    public function getTypes(): Collection
    {
        return $this->types;
    }

    public function addTypes(Type $types): self
    {
        if (!$this->types->contains($types)) {
            $this->types[] = $types;
        }

        return $this;
    }

    public function removeTypes(Type $type): self
    {
        $this->types->removeElement($type);

        return $this;
    }

    /**
     * @return Collection<int, Habitat>
     */
    public function getHabitats(): Collection
    {
        return $this->habitats;
    }


    public function addHabitats(Habitat $habitats): self
    {
        if (!$this->habitats->contains($habitats)) {
            $this->habitats[] = $habitats;

        }

        return $this;
    }

    public function removeHabitats(Habitat $habitat): self
    {
        $this->habitats->removeElement($habitat);

        return $this;
    }

    public function getRelatedCreatures(): ?array
    {
        return $this->relatedCreatures;
    }

    public function setRelatedCreatures(?array $relatedCreatures): self
    {
        $this->relatedCreatures = $relatedCreatures;

        return $this;
    }

    public function getOtherNames(): ?array
    {
        return $this->otherNames;
    }

    public function setOtherNames(?array $otherNames): self
    {
        $this->otherNames = $otherNames;

        return $this;
    }

    public function getSlug(): ?string
    {
        return $this->slug;
    }

    public function setSlug(?string $slug): self
    {
        $this->slug = $slug;

        return $this;
    }

    public function __toString()
    {
        return $this->name;
    }


    /**
     * Get the value of pictureFile
     *
     * @return  File/null
     */ 
    public function getPictureFile()
    {
        return $this->pictureFile;
    }

    /**
     * Set the value of pictureFile
     * @return  File/null
     */ 
    public function setPictureFile(?File $pictureFile): self
    {
        $this->pictureFile = $pictureFile;

        if($pictureFile){
            $this->createdAt = new \DateTime('now');
        }

        return $this;
    }



    public function getCodeCreature(): ?int
    {
        return $this->codeCreature;
    }

    public function setCodeCreature(int $codeCreature): self
    {
        $this->codeCreature = $codeCreature;

        return $this;
    }

}
