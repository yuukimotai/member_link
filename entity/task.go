package entity

import(
	"time"
)

type TaskID int64
type UuID string
type TaskStatus string

const (
	TaskStatusTodo TaskStatus = "todo"
	TaskStatusDoing TaskStatus = "doing"
	TaskStatusDone TaskStatus = "done"
)

type Task struct {
	ID TaskID `json:id`
	UID UuID `json:uid`
	Status TaskStatus `json:status`
	Created time.Time `json:created`
}

type Tasks []*Task