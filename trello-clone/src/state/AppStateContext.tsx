import { createContext, useContext } from "react";
import { AppState, List, Task } from "./types";
interface AppStateContextProps {
  lists: List[];
  getTasksByListId(id: string): Task[];
}

const appData: AppState = {
  lists: [
    {
      id: "0",
      text: "To Do",
      tasks: [
        { id: "c0", text: "Generate app scaffold" },
        { id: "c1", text: "Bully Sherwin" },
      ],
    },
    {
      id: "1",
      text: "In Progress",
      tasks: [{ id: "c2", text: "Learn Typescript" }],
    },
    {
      id: "2",
      text: "Done",
      tasks: [{ id: "c3", text: "Begin to use static typing" }],
    },
  ],
};

const AppStateContext = createContext<AppStateContextProps>(
  {} as AppStateContextProps,
);

export const AppStateProvider = ({
  children,
}: {
  children: React.ReactNode;
}) => {
  const { lists } = appData;

  const getTasksByListId = (id: string) => {
    return lists.find((list) => list.id === id)?.tasks || [];
  };

  return (
    <AppStateContext.Provider value={{ lists, getTasksByListId }}>
      {children}
    </AppStateContext.Provider>
  );
};

export const useAppState = () => {
  return useContext(AppStateContext);
};
