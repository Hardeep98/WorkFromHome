<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@ page
	import="org.hibernate.*,
org.hibernate.boot.*,
org.hibernate.boot.registry.StandardServiceRegistryBuilder,
org.hibernate.cfg.Configuration,
java.util.*,
com.niit.hhs.webannotations.Employee"%>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Heel</title>
</head>
<body>
	<%
		Configuration con = new Configuration();
		con.configure("hibernate.cfg.xml");
		SessionFactory sf = con.buildSessionFactory(new StandardServiceRegistryBuilder().configure().build());
		Session sess = sf.openSession();
		sess.beginTransaction();
		
		Employee e1=new Employee();
		e1.setFirstName("Karamjeet");
		e1.setLastName("Singh Dahion");
		
		sess.save(e1);
		sess.getTransaction().commit();
		out.print("Done");
		
		out.println("<br>"+"****************************"+"<br>");
		List<Employee> emp = sess.createQuery("from Employee").list();

		for(Employee e:emp)
		{
		out.println("<br>");
		out.println(e.getId() +" "+e.getFirstName()+" "+e.getLastName());
		}
		
		sess.close();
		sf.close();
		
	%>
</body>
</html>