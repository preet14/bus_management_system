/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modal;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author user
 */
public class StudentDAO {
    
    public boolean saveStudent(Student s)
    {
        boolean flag=true;
        Configuration cf = null;
        SessionFactory sf = null;
        Session session = null;
        
        try{
        cf = new Configuration();
        
        cf.configure("cfgpackage/hibernate2.cfg.xml");
        
        sf = cf.buildSessionFactory();
        
        session =sf.openSession();
        
        Transaction tx = session.beginTransaction();
        
        if(checkStudent(s)){
          session.save(s);
          flag=true;
        }
        else{
            flag=false;
        }
        
        tx.commit();
        }
        catch(Exception e1){
            flag=false;
            System.out.println("Error"+e1);
            e1.printStackTrace();
        }
        finally{
            
        session.close();
       
        sf.close();
        }
        
        return flag;
    }
    public boolean checkStudent(Student s)
    {
        boolean flag=true;
        
        Configuration cf = null;
        SessionFactory sf = null;
        Session session = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate2.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();
            
            String hql = "SELECT E.fname FROM Student E where E.roll = :r_name";

            Query query = session.createQuery(hql);
            
            query.setParameter("r_name",s.getRoll());

            ArrayList<Student> results = (ArrayList<Student>) query.list();
            
            if(results==null || results.size()==0)
            {
                flag=true;
            }
            else{
                flag=false;
            }
            
            tx.commit();
        }
        catch(Exception e1){
            
            System.out.println("Error"+e1);
            flag=false;
            e1.printStackTrace();
        }
        finally{
            
        session.close();
       
        sf.close();
        }
      
        return flag;
    }
    
    public boolean check(Student original)
    {
        boolean flag = false;
        Configuration cf = null;
        SessionFactory sf = null;
        Session session = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate2.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();
            
            String hql = "FROM Student E where E.roll = :r_name and E.pwd= :psd";

            Query query = session.createQuery(hql);
            
            query.setParameter("r_name",original.getRoll());
            
            query.setParameter("psd",original.getPwd());

            ArrayList<Student> results = (ArrayList<Student>) query.list();
            
            if(results==null || results.size()==0)
            {
                flag=false;
            }
            else{
                flag=true;
            }
            
            tx.commit();
        }
        catch(Exception e1){
            
            System.out.println("Error"+e1);
            flag=false;
            e1.printStackTrace();
        }
        finally{
            
        session.close();
       
        sf.close();
        }
      
        return flag;
    }
    
    public ArrayList<Student> studentProfile(int roll)
    {
        ArrayList<Student> results = null;

        Configuration cf = null;
        
        SessionFactory sf = null;
        
        Session session = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate2.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();

            String hql = "FROM Student s where s.roll=:r_no";
            
            Query query = session.createQuery(hql);
            
            query.setParameter("r_no",roll);

            results = (ArrayList<Student>) query.list();
            
            tx.commit();
        }
        catch(Exception e1){
            
            System.out.println("Error"+e1);
            
            e1.printStackTrace();
        }
        finally{
            
            session.close();

            sf.close();
        }
        
        return results;
    }
    
    public ArrayList<Student> getAllStudents(){
        
        ArrayList<Student> results = null;
        
        Configuration cf = null;
        
        SessionFactory sf = null;
        
        Session session = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate2.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();

            String hql = "FROM Student s where s.permission=:permit";
            
            Query query = session.createQuery(hql);
            
            String s1 = "NULL";
            
            query.setParameter("permit",s1);

            results = (ArrayList<Student>) query.list();
            
            tx.commit();
        }
        catch(Exception e1){
            
            System.out.println("Error"+e1);
            
            e1.printStackTrace();
        }
        finally{
            
            session.close();

            sf.close();
        }
        
        return results;
        
    }
    
    
    public ArrayList<Student> getAllStudentsInfo(){
        
        ArrayList<Student> results = null;
        
        ArrayList<Student> finalResult = null; 
        
        ArrayList<Student> fr = new ArrayList<Student>();
        
        Configuration cf = null;
        
        SessionFactory sf = null;
        
        Session session = null;
        
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate2.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();

            String hql = "SELECT distinct s.route FROM Student s";
            
            Query query = session.createQuery(hql);
                        
            results = (ArrayList<Student>) query.list();
            
            for(int i=0;i<results.size();i++){
                
                String hql1 = "FROM Student s where s.route= :rn";
            
                Query query1 = session.createQuery(hql1);
                
                query1.setParameter("rn",results.get(i));
                        
                finalResult = (ArrayList<Student>) query1.list();
                for(int j=0;j<finalResult.size();j++){
                    Student s = new Student();
                    s.setRoll(finalResult.get(j).getRoll());
                    s.setAddress(finalResult.get(j).getAddress());
                    s.setBranch(finalResult.get(j).getBranch());
                    s.setFname(finalResult.get(j).getFname());
                    s.setLname(finalResult.get(j).getLname());
                    s.setMobno(finalResult.get(j).getMobno());
                    s.setPermission(finalResult.get(j).getPermission());
                    s.setPickup(finalResult.get(j).getPickup());
                    s.setPwd(finalResult.get(j).getPwd());
                    s.setRoute(finalResult.get(j).getRoute());
                    s.setEmail(finalResult.get(j).getEmail());
                    s.setPickup(finalResult.get(j).getPickup());
                    fr.add(s);
                }
            }
            
            tx.commit();
        }
        catch(Exception e1){
            
            System.out.println("Error"+e1);
            
            e1.printStackTrace();
        }
        finally{
            
            session.close();

            sf.close();
        }
        
        return fr;
        
    }
    
    public boolean deleteStu(int roll){
        boolean flag = false;
        Configuration cf = null;
        SessionFactory sf = null;
        Session session = null;
        ArrayList<Student> results = null;
        try{
            cf = new Configuration();

            cf.configure("cfgpackage/hibernate2.cfg.xml");

            sf = cf.buildSessionFactory();

            session =sf.openSession();

            Transaction tx = session.beginTransaction();

            Query qry = session.createQuery("delete from Student p where p.roll=:r_name");
	    qry.setParameter("r_name",roll);
            int res = qry.executeUpdate();
            
            String hql1 = "FROM Student where roll= :rl";

            Query query1 = session.createQuery(hql1);
            
            query1.setParameter("rl",roll);
            
            results = (ArrayList<Student>) query1.list();
            
            if(results!=null || results.size()!=0)
            {
                flag=false;
            }
            else{
                flag=true;
            }
            
            tx.commit();
        }
        catch(Exception e1){
            
            System.out.println("Error"+e1);
            
            e1.printStackTrace();
            
            flag=false;
        }
        finally{
            
            session.close();

            sf.close();
        }

        return flag;
    }
    
}
