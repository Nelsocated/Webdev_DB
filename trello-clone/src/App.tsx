import { AppContainer } from "./styles";

import { Column } from "./components/Column";
import { AddNewItem } from "./components/AddNewItem";
import { useAppState } from "./state/AppStateContext";

const App = () => {
  const { lists } = useAppState()
  return (
    // for every list in lists, we will make a Column Component
    <AppContainer>
      {
        lists.map((list) => (
          <Column id={list.id} text={list.text} />
        ))
      }
      <AddNewItem
        onAdd={console.log}
        toggleButtonText="+ Add another list"
      />
    </AppContainer>
  );
};

export default App;
