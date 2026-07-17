import { Action } from "./actions";
import { Task, List, AppState } from "./types";

export const appStateReducer = (
  state: AppState,
  action: Action,
): AppState | void => {
  switch (action.type) {
    case "Add_List":
      const highestId = Math.max(
        ...state.lists.map((list) => parseInt(list.id)),
      );

      return {
        lists: [
          ...state.lists,
          {
            id: highestId + 1 + "",
            text: action.payload,
            tasks: [],
          },
        ],
      };

    case "Add_Task":
      // const highestId = Math.max(...list.tasks.map((task) => parseInt(task.id))),
      const highestTaskId = Math.max(
        ...state,
        state.lists.map((list) => list.tasks.map((task) => parseInt(task.id))),
      );
      return {
        ...state,
        lists: state.lists.map((list) => {
          if (list.id === action.payload.listId) {
            return {
              ...list,
              tasks: [
                ...list.tasks,
                {
                  id: highestTaskId + 1 + "",
                  text: action.payload.text,
                },
              ],
            };
          }

          return list;
        }),
      };
    default:
      break;
  }
};
