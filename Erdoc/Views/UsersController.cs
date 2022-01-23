using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Erdoc.Models;

namespace Erdoc.Views
{
    public class UsersController : Controller
    {
        private POCEntities db = new POCEntities();   
   
       

        // GET: Users/Create
        public ActionResult Login()
        {
            return View();
        }

        // POST: Users/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]

        public ActionResult Login(User user)
        {
            var userdata = db.Users.Where(i => i.LoginName.ToLower().Contains(user.LoginName)).FirstOrDefault();

            if (userdata == null)
            {
                return HttpNotFound();
            }

            if (userdata.Password == user.Password)
            {
                int userid = userdata.UserID;
                var userole = db.UserRoles.Where(k => k.UserID == userid).FirstOrDefault();
                var objrolename = userole.Rolename;
                if(objrolename == "Admin")
                {
                    return RedirectToAction("Index", "Doctors");
                }
                if(objrolename == "Patient")
                {
                    return RedirectToAction("Index", "PatientAppointments");
                }
                if (objrolename == "Doctor")
                {
                    return RedirectToAction("ViewApppoints", "PatientAppointmentsHistory");
                }
                return RedirectToAction("Index", "Dashboard");
            }

            return RedirectToAction("Index", "Dashboard");
        }





        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
