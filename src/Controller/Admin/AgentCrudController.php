<?php

namespace App\Controller\Admin;

use App\Entity\Agent;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;

use EasyCorp\Bundle\EasyAdminBundle\Field\EmailField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use Vich\UploaderBundle\Form\Type\ VichImageType;

class AgentCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Agent::class;
    }

    
    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new('name'),
            TextField::new('lastname'),
            TextField::new('tel'),
            EmailField::new('email'),
           
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
