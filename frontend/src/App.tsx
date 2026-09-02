import "./App.css";
import { PieList } from "./components/PieList";
import { Container } from "./components/styles";
import { PieProvider } from "./context/pieContext";

function App() {
  return (
    <PieProvider>
      <Container>
        <h1>The Pie Shop</h1>
        <PieList />
      </Container>
    </PieProvider>
  );
}

export default App;
