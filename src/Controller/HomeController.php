<?php

namespace App\Controller;
use App\Entity\Property;
use App\Entity\Agent;
use App\Entity\Contact;
use App\Form\PropertyType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;


class HomeController extends AbstractController
{
    /**
     * @Route("/home", name="home")
     */
    public function index(): Response
    {
        $repo = $this->getDoctrine()->getRepository(Property::class);
        $properti= $repo->findAll() ;
        dump( $properti);
        
        return $this->render('home/prperty-grid.html.twig', [
            'controller_name' => 'HomeController',
            'items'=>$properti,
        ]);
    }
     /**
     * @Route("/about", name="about")
     */
    public function about(): Response
    {
        
        
        return $this->render('home/about.html.twig', [
            'controller_name' => 'HomeController',
            
        ]);
    }
    /**
     * @Route("/agents", name="agents")
     */
    public function agents(): Response
    {
        $repo = $this->getDoctrine()->getRepository(Agent::class);
        $properti= $repo->findAll() ;
        dump( $properti);
        
        return $this->render('home/agents-grid.html.twig', [
            'controller_name' => 'HomeController',
            'items'=>$properti,
        ]);
    }
    /**
     * @Route("/contact", name="contact")
     */
    public function contact(): Response
    {
       
        
        return $this->render('home/contact.html.twig', [
            'controller_name' => 'HomeController',
            
        ]);
    }
      /**
     * @Route("/", name="homes")
     */
    public function in(): Response
    {
        $repo = $this->getDoctrine()->getRepository(Property::class);
        $properti= $repo->findBy(array(),array('id'=>'DESC'),3,0);
        $propertis= $repo->findBy(array(),array('id'=>'DESC'),4,0);
        $repos = $this->getDoctrine()->getRepository(Agent::class);
        $agent= $repos->findBy(array(),array('id'=>'DESC'),3,0);
       
       
        
        return $this->render('home/hela.html.twig', [
            'controller_name' => 'HomeController',
            'items'=>$properti,
            'props'=>$propertis,
            'propss'=>$agent,
           
        ]);
    }
     
   
    /**
     * @Route("/element/{id}", name="element")
     */
    public function element(Request $request,$id): Response
    {

        $properti = new Property();
        $repo = $this->getDoctrine()->getRepository(Property::class);
        $properti= $repo->find($id) ;
        $agent = new Agent();
        $repos = $this->getDoctrine()->getRepository(Agent::class);
        $agent= $repos->find($id) ;
       
            
        return $this->render('home/property-single.html.twig', [
        'controller_name' => 'HomeController',
        'props'=>$properti,
        'propss'=>$agent,
        

    ]);
    }
    
    /**
     * @Route("/ele/{id}", name="ele")
     */
    public function ele(Request $request,$id): Response
    {

       
        $agent = new Agent();
        $repos = $this->getDoctrine()->getRepository(Agent::class);
        $agent= $repos->find($id) ;
       
            
        return $this->render('home/agent-single.html.twig', [
        'controller_name' => 'HomeController',
        
        'propss'=>$agent,
        

    ]);
    }
    
    /**
     * @Route("/elements/{id}", name="elements")
     */
    public function elements(Request $request,$id): Response
    {

        $properti = new Property();
        $repo = $this->getDoctrine()->getRepository(Property::class);
        $properti= $repo->find($id) ;
        $form = $this->createForm(PropertyType::class, $properti);
       
            
            
        return $this->render('home/property-single.html.twig', [
        'controller_name' => 'HomeController',
        'form' => $form->CreateView(),
        

    ]);
    }
    /**
     * @Route("/add", name="add")
     */
    public function add(Request $request): Response
    {

        $name = $request->request->get('name');
       
        $email = $request->request->get('email');
        $subject = $request->request->get('subject');
        $message = $request->request->get('message');

        $entitymanager = $this->getDoctrine()->getManager();
        $client = new Contact();
        $client->setName($name);
        
        $client->setEmail($email);
        $client->setSubject($subject);
        $client->setMessage($message);
        $entitymanager->persist($client);
        $entitymanager->flush();
        return $this->redirectToRoute('contact');
            
       
        return $this->render('home/contact.html.twig', [
            'controller_name' => 'HomeController',
        ]);
    }
}
