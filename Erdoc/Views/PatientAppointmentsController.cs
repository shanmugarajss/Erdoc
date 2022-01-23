using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using Erdoc.Models;

namespace Erdoc.Views
{
    public class PatientAppointmentsController : Controller
    {
        private POCEntities db = new POCEntities();

        // GET: PatientAppointments
        public ActionResult Index()
        {
            //var patientAppointments = db.PatientAppointments.Where(s => s.IsDeleted == true).ToList();
            return View(db.PatientAppointments.ToList());
        }
        
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PatientAppointment patientAppointment = db.PatientAppointments.Find(id);
            if (patientAppointment == null)
            {
                return HttpNotFound();
            }
            return View(patientAppointment);
        }

        // GET: PatientAppointments/Create
        public ActionResult Create()
        {
            ViewBag.DoctorId = new SelectList(db.Doctors, "ID", "First_name");
            ViewBag.Patientid = new SelectList(db.Patients, "ID", "First_name");
            return View();
        }

        // POST: PatientAppointments/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,First_name,Last_Name,Email,Mobile,AppointmentDate,Specialist,DoctorId,Patientid,MorningSession,Morningid,NoonSession,Noonid,EveningSession,Eveningid,Note,Comment,Status,CreatedDate,CreatedByID,ModifiedDate,ModifiedByID,IsDeleted")] PatientAppointment patientAppointment)
        {
            if (ModelState.IsValid)
            {
                db.PatientAppointments.Add(patientAppointment);
                patientAppointment.CreatedDate = DateTime.Now;
                patientAppointment.CreatedByID = 1;
                patientAppointment.IsDeleted = true;
                patientAppointment.Status = "NEW"; 
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.DoctorId = new SelectList(db.Doctors, "ID", "First_name", patientAppointment.DoctorId);
            ViewBag.Patientid = new SelectList(db.Patients, "ID", "First_name", patientAppointment.Patientid);
            return View(patientAppointment);
        }

        // GET: PatientAppointments/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PatientAppointment patientAppointment = db.PatientAppointments.Find(id);
            if (patientAppointment == null)
            {
                return HttpNotFound();
            }
            ViewBag.DoctorId = new SelectList(db.Doctors, "ID", "First_name", patientAppointment.DoctorId);
            ViewBag.Patientid = new SelectList(db.Patients, "ID", "First_name", patientAppointment.Patientid);
            return View(patientAppointment);
        }

        // POST: PatientAppointments/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,First_name,Last_Name,Email,Mobile,AppointmentDate,Specialist,DoctorId,Patientid,MorningSession,Morningid,NoonSession,Noonid,EveningSession,Eveningid,Note,Comment,Status,CreatedDate,CreatedByID,ModifiedDate,ModifiedByID,IsDeleted")] PatientAppointment patientAppointment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(patientAppointment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.DoctorId = new SelectList(db.Doctors, "ID", "First_name", patientAppointment.DoctorId);
            ViewBag.Patientid = new SelectList(db.Patients, "ID", "First_name", patientAppointment.Patientid);
            return View(patientAppointment);
        }

        // GET: PatientAppointments/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PatientAppointment patientAppointment = db.PatientAppointments.Find(id);
            if (patientAppointment == null)
            {
                return HttpNotFound();
            }
            return View(patientAppointment);
        }

        // POST: PatientAppointments/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PatientAppointment patientAppointment = db.PatientAppointments.Find(id);
            db.PatientAppointments.Remove(patientAppointment);
            patientAppointment.IsDeleted = false;
            db.SaveChanges();
            db.SaveChanges();
            return RedirectToAction("Index");
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
