using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using STG_WEB.Models;

namespace STG_WEB.Controllers
{
    public class UnavaliableHoursController : Controller
    {
        private STGEntities db = new STGEntities();

        // GET: UnavaliableHours
        public ActionResult Index()
        {
            var unavaliableHours = db.UnavaliableHours.Include(u => u.SchoolTeacher);
            return View(unavaliableHours.ToList());
        }

        // GET: UnavaliableHours/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UnavaliableHours unavaliableHours = db.UnavaliableHours.Find(id);
            if (unavaliableHours == null)
            {
                return HttpNotFound();
            }
            return View(unavaliableHours);
        }

        // GET: UnavaliableHours/Create
        public ActionResult Create()
        {
            ViewBag.SchoolTeacherId = new SelectList(db.SchoolTeacher, "Id", "Id");
            return View();
        }

        // POST: UnavaliableHours/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SchoolTeacherId,Year,Semester,Hours")] UnavaliableHours unavaliableHours)
        {
            if (ModelState.IsValid)
            {
                db.UnavaliableHours.Add(unavaliableHours);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.SchoolTeacherId = new SelectList(db.SchoolTeacher, "Id", "Id", unavaliableHours.SchoolTeacherId);
            return View(unavaliableHours);
        }

        // GET: UnavaliableHours/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UnavaliableHours unavaliableHours = db.UnavaliableHours.Find(id);
            if (unavaliableHours == null)
            {
                return HttpNotFound();
            }
            ViewBag.SchoolTeacherId = new SelectList(db.SchoolTeacher, "Id", "Id", unavaliableHours.SchoolTeacherId);
            return View(unavaliableHours);
        }

        // POST: UnavaliableHours/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SchoolTeacherId,Year,Semester,Hours")] UnavaliableHours unavaliableHours)
        {
            if (ModelState.IsValid)
            {
                db.Entry(unavaliableHours).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.SchoolTeacherId = new SelectList(db.SchoolTeacher, "Id", "Id", unavaliableHours.SchoolTeacherId);
            return View(unavaliableHours);
        }

        // GET: UnavaliableHours/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UnavaliableHours unavaliableHours = db.UnavaliableHours.Find(id);
            if (unavaliableHours == null)
            {
                return HttpNotFound();
            }
            return View(unavaliableHours);
        }

        // POST: UnavaliableHours/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            UnavaliableHours unavaliableHours = db.UnavaliableHours.Find(id);
            db.UnavaliableHours.Remove(unavaliableHours);
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
