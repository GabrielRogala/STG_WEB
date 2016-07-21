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
    public class TimetablesController : Controller
    {
        private STGEntities db = new STGEntities();

        // GET: Timetables
        public ActionResult Index()
        {
            var timetable = db.Timetable.Include(t => t.School).Include(t => t.GroupSubjectTeacher).Include(t => t.Room);
            return View(timetable.ToList());
        }

        // GET: Timetables/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Timetable timetable = db.Timetable.Find(id);
            if (timetable == null)
            {
                return HttpNotFound();
            }
            return View(timetable);
        }

        // GET: Timetables/Create
        public ActionResult Create()
        {
            ViewBag.SchoolId = new SelectList(db.School, "Id", "Name");
            ViewBag.GroupSubjectTeacherSemester = new SelectList(db.GroupSubjectTeacher, "Semester", "Schedule");
            ViewBag.RoomId = new SelectList(db.Room, "Id", "Nr");
            return View();
        }

        // POST: Timetables/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Size,Part,Day,Hour,SchoolId,GroupSubjectTeacherSemester,GroupSubjectTeacherTeacherId,GroupSubjectTeacherGroupId,GroupSubjectTeacherSubjectId,RoomId")] Timetable timetable)
        {
            if (ModelState.IsValid)
            {
                db.Timetable.Add(timetable);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.SchoolId = new SelectList(db.School, "Id", "Name", timetable.SchoolId);
            ViewBag.GroupSubjectTeacherSemester = new SelectList(db.GroupSubjectTeacher, "Semester", "Schedule", timetable.GroupSubjectTeacherSemester);
            ViewBag.RoomId = new SelectList(db.Room, "Id", "Nr", timetable.RoomId);
            return View(timetable);
        }

        // GET: Timetables/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Timetable timetable = db.Timetable.Find(id);
            if (timetable == null)
            {
                return HttpNotFound();
            }
            ViewBag.SchoolId = new SelectList(db.School, "Id", "Name", timetable.SchoolId);
            ViewBag.GroupSubjectTeacherSemester = new SelectList(db.GroupSubjectTeacher, "Semester", "Schedule", timetable.GroupSubjectTeacherSemester);
            ViewBag.RoomId = new SelectList(db.Room, "Id", "Nr", timetable.RoomId);
            return View(timetable);
        }

        // POST: Timetables/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Size,Part,Day,Hour,SchoolId,GroupSubjectTeacherSemester,GroupSubjectTeacherTeacherId,GroupSubjectTeacherGroupId,GroupSubjectTeacherSubjectId,RoomId")] Timetable timetable)
        {
            if (ModelState.IsValid)
            {
                db.Entry(timetable).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.SchoolId = new SelectList(db.School, "Id", "Name", timetable.SchoolId);
            ViewBag.GroupSubjectTeacherSemester = new SelectList(db.GroupSubjectTeacher, "Semester", "Schedule", timetable.GroupSubjectTeacherSemester);
            ViewBag.RoomId = new SelectList(db.Room, "Id", "Nr", timetable.RoomId);
            return View(timetable);
        }

        // GET: Timetables/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Timetable timetable = db.Timetable.Find(id);
            if (timetable == null)
            {
                return HttpNotFound();
            }
            return View(timetable);
        }

        // POST: Timetables/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Timetable timetable = db.Timetable.Find(id);
            db.Timetable.Remove(timetable);
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
