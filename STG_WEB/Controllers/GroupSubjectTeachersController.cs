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
    public class GroupSubjectTeachersController : Controller
    {
        private STGEntities db = new STGEntities();

        // GET: GroupSubjectTeachers
        public ActionResult Index()
        {
            var groupSubjectTeacher = db.GroupSubjectTeacher.Include(g => g.Teacher).Include(g => g.Group).Include(g => g.Subject).Include(g => g.RoomType);
            return View(groupSubjectTeacher.ToList());
        }

        // GET: GroupSubjectTeachers/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GroupSubjectTeacher groupSubjectTeacher = db.GroupSubjectTeacher.Find(id);
            if (groupSubjectTeacher == null)
            {
                return HttpNotFound();
            }
            return View(groupSubjectTeacher);
        }

        // GET: GroupSubjectTeachers/Create
        public ActionResult Create()
        {
            ViewBag.TeacherId = new SelectList(db.Teacher, "Id", "Name");
            ViewBag.GroupId = new SelectList(db.Group, "Id", "Name");
            ViewBag.SubjectId = new SelectList(db.Subject, "Id", "Name");
            ViewBag.RoomTypeId = new SelectList(db.RoomType, "Id", "Name");
            return View();
        }

        // POST: GroupSubjectTeachers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Semester,Schedule,TeacherId,GroupId,SubjectId,RoomTypeId")] GroupSubjectTeacher groupSubjectTeacher)
        {
            if (ModelState.IsValid)
            {
                db.GroupSubjectTeacher.Add(groupSubjectTeacher);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.TeacherId = new SelectList(db.Teacher, "Id", "Name", groupSubjectTeacher.TeacherId);
            ViewBag.GroupId = new SelectList(db.Group, "Id", "Name", groupSubjectTeacher.GroupId);
            ViewBag.SubjectId = new SelectList(db.Subject, "Id", "Name", groupSubjectTeacher.SubjectId);
            ViewBag.RoomTypeId = new SelectList(db.RoomType, "Id", "Name", groupSubjectTeacher.RoomTypeId);
            return View(groupSubjectTeacher);
        }

        // GET: GroupSubjectTeachers/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GroupSubjectTeacher groupSubjectTeacher = db.GroupSubjectTeacher.Find(id);
            if (groupSubjectTeacher == null)
            {
                return HttpNotFound();
            }
            ViewBag.TeacherId = new SelectList(db.Teacher, "Id", "Name", groupSubjectTeacher.TeacherId);
            ViewBag.GroupId = new SelectList(db.Group, "Id", "Name", groupSubjectTeacher.GroupId);
            ViewBag.SubjectId = new SelectList(db.Subject, "Id", "Name", groupSubjectTeacher.SubjectId);
            ViewBag.RoomTypeId = new SelectList(db.RoomType, "Id", "Name", groupSubjectTeacher.RoomTypeId);
            return View(groupSubjectTeacher);
        }

        // POST: GroupSubjectTeachers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Semester,Schedule,TeacherId,GroupId,SubjectId,RoomTypeId")] GroupSubjectTeacher groupSubjectTeacher)
        {
            if (ModelState.IsValid)
            {
                db.Entry(groupSubjectTeacher).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TeacherId = new SelectList(db.Teacher, "Id", "Name", groupSubjectTeacher.TeacherId);
            ViewBag.GroupId = new SelectList(db.Group, "Id", "Name", groupSubjectTeacher.GroupId);
            ViewBag.SubjectId = new SelectList(db.Subject, "Id", "Name", groupSubjectTeacher.SubjectId);
            ViewBag.RoomTypeId = new SelectList(db.RoomType, "Id", "Name", groupSubjectTeacher.RoomTypeId);
            return View(groupSubjectTeacher);
        }

        // GET: GroupSubjectTeachers/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GroupSubjectTeacher groupSubjectTeacher = db.GroupSubjectTeacher.Find(id);
            if (groupSubjectTeacher == null)
            {
                return HttpNotFound();
            }
            return View(groupSubjectTeacher);
        }

        // POST: GroupSubjectTeachers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            GroupSubjectTeacher groupSubjectTeacher = db.GroupSubjectTeacher.Find(id);
            db.GroupSubjectTeacher.Remove(groupSubjectTeacher);
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
