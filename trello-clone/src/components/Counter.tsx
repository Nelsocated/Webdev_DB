import { CounterNumber, CounterButton } from "../styles";
import { useReducer } from "react";

interface Count {
  count: number;
}

type CountAction = {
  type: "INCREMENT"
} | {
  type: "DECREMENT"
}

const Counter = () => {
  const initialState = { count: 0 };

  function countReducer(state: Count, action: CountAction) {
    switch (action.type) {
      case "INCREMENT":
        return { count: state.count + 1 };
      case "DECREMENT":
        return { count: state.count - 1 };
      default:
        return state;
    }
  }

  const [state, dispatch] = useReducer(countReducer, initialState);

  const increment = (): CountAction => ({type: "INCREMENT"})
  const decrement = (): CountAction => ({type: "DECREMENT"})

  return (
    <div
      style={{ display: "flex", flexDirection: "column", padding: 25, gap: 10 }}
    >
      <CounterNumber>
        <center>{state.count}</center>
      </CounterNumber>
      <div style={{ display: "flex", gap: 15, justifyContent: "center" }}>
        <CounterButton onClick={() => dispatch(decrement())}>-1</CounterButton>
        <CounterButton onClick={() => dispatch(increment())}>+1</CounterButton>
      </div>
    </div>
  );
};

export default Counter;
