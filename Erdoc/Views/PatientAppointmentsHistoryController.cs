using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Erdoc.Models;
namespace Erdoc.Views
{
    public class PatientAppointmentsHistoryController : Controller
    {
        private POCEntities db = new POCEntities();
        // GET: PatientAppointmentsHistory
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
        public ActionResult ViewApppoints()
        {
            var patientAppointments = db.PatientAppointments.Where(s => s.IsDeleted == true && s.Status == "New");
            return View(patientAppointments.ToList());
        }
        public ActionResult Viewauth(int? id)
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

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Viewauth([Bind(Include = "ID,First_name,Last_Name,Email,Mobile,AppointmentDate,Specialist,DoctorId,Patientid,MorningSession,Morningid,NoonSession,Noonid,EveningSession,Eveningid,Note,Comment,Status,CreatedDate,CreatedByID,ModifiedDate,ModifiedByID,IsDeleted")] PatientAppointment patientAppointment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(patientAppointment).State = EntityState.Modified;
                patientAppointment.Status = "Approve";
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.DoctorId = new SelectList(db.Doctors, "ID", "First_name", patientAppointment.DoctorId);
            ViewBag.Patientid = new SelectList(db.Patients, "ID", "First_name", patientAppointment.Patientid);
            return View(patientAppointment);
        }
        // GET: PatientAppointments/Details/5


        public ActionResult Viewauth1(int? id)
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

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Viewauth1([Bind(Include = "ID,First_name,Last_Name,Email,Mobile,AppointmentDate,Specialist,DoctorId,Patientid,MorningSession,Morningid,NoonSession,Noonid,EveningSession,Eveningid,Note,Comment,Status,CreatedDate,CreatedByID,ModifiedDate,ModifiedByID,IsDeleted")] PatientAppointment patientAppointment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(patientAppointment).State = EntityState.Modified;
                patientAppointment.Status = "Reject";
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.DoctorId = new SelectList(db.Doctors, "ID", "First_name", patientAppointment.DoctorId);
            ViewBag.Patientid = new SelectList(db.Patients, "ID", "First_name", patientAppointment.Patientid);
            return View(patientAppointment);
        }
    }
}