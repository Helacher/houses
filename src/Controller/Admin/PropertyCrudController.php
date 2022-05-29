<?php

namespace App\Controller\Admin;
use App\Entity\Agent;
use App\Entity\Property;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\NumberField;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ChoiceField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use Vich\UploaderBundle\Form\Type\ VichImageType;

class PropertyCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Property::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new('title'),
            TextField::new('adress'),
           
            TextField::new('city'),
            NumberField::new('price'),
            NumberField::new('rooms'),
            NumberField::new('floors'),
            BooleanField::new('sold'),
            ImageField::new('image')
            ->SetBasePath($this->getParameter( "app.path.product_images"))
            ->onlyOnIndex(),
            TextareaField::new('imageFile',"Product image")
            ->SetFormType(VichImageType::class)
            ->hideOnIndex()
            ->SetFormTypeOption('allow_delete',false),
        ];
    }
    
}
