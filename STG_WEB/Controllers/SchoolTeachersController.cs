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
    public class SchoolTeachersController : Controller
    {
        private STGEntities db = new STGEntities();

        // GET: SchoolTeachers
        public ActionResult Index()
        {
            var schoolTeacher = db.SchoolTeacher.Include(s => s.School).Include(s => s.Teacher);
            return View(schoolTeacher.ToList());
        }

        // GET: SchoolTeachers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SchoolTeacher schoolTeacher = db.SchoolTeacher.Find(id);
            if (schoolTeacher == null)
            {
                return HttpNotFound();
            }
            return View(schoolTeacher);
        }

        // GET: SchoolTeachers/Create
        public ActionResult Create()
        {
            ViewBag.SchoolId = new SelectList(db.School, "Id", "Name");
            ViewBag.TeacherId = new SelectList(db.Teacher, "Id", "Name");
            return View();
        }

        // POST: SchoolTeachers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,SchoolId,TeacherId")] SchoolTeacher schoolTeacher)
        {
            if (ModelState.IsValid)
            {
                db.SchoolTeacher.Add(schoolTeacher);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.SchoolId = new SelectList(db.School, "Id", "Name", schoolTeacher.SchoolId);
            ViewBag.TeacherId = new SelectList(db.Teacher, "Id", "Name", schoolTeacher.TeacherId);
            return View(schoolTeacher);
        }

        // GET: SchoolTeachers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SchoolTeacher schoolTeacher = db.SchoolTeacher.Find(id);
            if (schoolTeacher == null)
            {
                return HttpNotFound();
            }
            ViewBag.SchoolId = new SelectList(db.School, "Id", "Name", schoolTeacher.SchoolId);
            ViewBag.TeacherId = new SelectList(db.Teacher, "Id", "Name", schoolTeacher.TeacherId);
            return View(schoolTeacher);
        }

        // POST: SchoolTeachers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,SchoolId,TeacherId")] SchoolTeacher schoolTeacher)
        {
            if (ModelState.IsValid)
            {
                db.Entry(schoolTeacher).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.SchoolId = new SelectList(db.School, "Id", "Name", schoolTeacher.SchoolId);
            ViewBag.TeacherId = new SelectList(db.Teacher, "Id", "Name", schoolTeacher.TeacherId);
            return View(schoolTeacher);
        }

        // GET: SchoolTeachers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SchoolTeacher schoolTeacher = db.SchoolTeacher.Find(id);
            if (schoolTeacher == null)
            {
                return HttpNotFound();
            }
            return View(schoolTeacher);
        }

        // POST: SchoolTeachers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SchoolTeacher schoolTeacher = db.SchoolTeacher.Find(id);
            db.SchoolTeacher.Remove(schoolTeacher);
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
