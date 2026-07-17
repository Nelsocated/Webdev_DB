/* export type Action =
  | {
      type: "Add_List";
      payload: string;
    }
  | {
      type: "Add_Task";
      payload: {
        text: string;
        listId: string;
      };
    };
 */

interface AddListAction {
  type: "Add_List";
  payload: string;
}

interface AddTaskAction {
  type: "Add_Task";
  payload: {
    text: string;
    listId: string;
  };
}

export type Action = AddListAction | AddTaskAction;

export const addList = (payload: string): Action => ({
  type: "Add_List",
  payload,
});

export const addTask = (text: string, listId: string): Action => ({
  type: "Add_Task",
  payload: {
    text,
    listId,
  },
});
