<?php

namespace App\Entity;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use App\Repository\PropertyRepository;
use Doctrine\ORM\Mapping as ORM;
use Vich\UploaderBundle\Mapping\Annotation as Vich;
use Symfony\Component\Validator\Constraints as Assert;


/**

 * @ORM\Entity(repositoryClass=PropertyRepository::class)
 * @Vich\Uploadable
 * @UniqueEntity(fields={"title"}, message="There is already a house with this name")
 
 */
class Property
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     
     

     
     * @Assert\NotBlank
     * @Assert\Length(min=3)
     * @ORM\Column(type="string", length=255)
     */
    private $title;

    /**
     
     * @Assert\Positive
     * @ORM\Column(type="float")
     */
    private $price;

    /**
      * @Assert\Range(
     *      min = 1,
     *      max = 11,
     *      notInRangeMessage = "rooms  must be between {{ min }}  and  {{ max }}  to save",
     * )
     * @ORM\Column(type="integer")
     */
    private $rooms;

    /**
      * @Assert\Range(
     *      min = 1,
     *      max = 5,
     *      notInRangeMessage = "floors  must be between {{ min }}  and  {{ max }}  to save",
     * )
     * @ORM\Column(type="integer")
     */
    private $floors;

    /**
     
     * @ORM\Column(type="string", length=255)
     */
    private $adress;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $city;

    /**
     * @ORM\Column(type="boolean")
     */
    private $sold;
     /**
     * @ORM\Column(type="string", length=255)
     * @var string
     */
    private $image;

    /**
     * @Vich\UploadableField(mapping="product_images", fileNameProperty="image")
     * @var File
     */
    private $imageFile;

    /**
     * @ORM\ManyToOne(targetEntity=Agent::class, inversedBy="property")
     */
    private $agent;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): self
    {
        $this->title = $title;

        return $this;
    }

    public function getPrice(): ?float
    {
        return $this->price;
    }

    public function setPrice(float $price): self
    {
        $this->price = $price;

        return $this;
    }

    public function getRooms(): ?int
    {
        return $this->rooms;
    }

    public function setRooms(int $rooms): self
    {
        $this->rooms = $rooms;

        return $this;
    }

    public function getFloors(): ?int
    {
        return $this->floors;
    }

    public function setFloors(int $floors): self
    {
        $this->floors = $floors;

        return $this;
    }

    public function getAdress(): ?string
    {
        return $this->adress;
    }

    public function setAdress(string $adress): self
    {
        $this->adress = $adress;

        return $this;
    }

    public function getCity(): ?string
    {
        return $this->city;
    }

    public function setCity(string $city): self
    {
        $this->city = $city;

        return $this;
    }

    public function getSold(): ?bool
    {
        return $this->sold;
    }

    public function setSold(bool $sold): self
    {
        $this->sold = $sold;

        return $this;
    }
    public function setImageFile( $image = null)
    {
        $this->imageFile = $image;

        // VERY IMPORTANT:
        // It is required that at least one field changes if you are using Doctrine,
        // otherwise the event listeners won't be called and the file is lost
        if ($this->image instanceof UploadedFile) {
            $this->updatedAt = new \DateTime('start_at');
        }
    }

    public function getImageFile()
    {
        return $this->imageFile;
    }

    public function setImage( $image) {
        $this->image = $image;
    }

    public function getImage()
    {
        return $this->image;
    }

    public function getAgent(): ?Agent
    {
        return $this->agent;
    }

    public function setAgent(?Agent $agent): self
    {
        $this->agent = $agent;

        return $this;
    }
    public function __toString()
    {
        return $this->title;
    }

}
