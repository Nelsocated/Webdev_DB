import { ColumnContainer, ColumnTitle } from "../styles";
import { Card } from "./Card";
import { AddNewItem } from "./AddNewItem";
import React, { useState } from "react";
import { useAppState } from "../state/AppStateContext";

type ColumnProps = {
  text?: string;
  id: string;
};

export const Column: React.FC<ColumnProps> = ({ text, id }: ColumnProps) => {
  // getTasksByListId
  const { getTasksByListId } = useAppState();

  const tasks = getTasksByListId(id);

  return (
    <ColumnContainer>
      <ColumnTitle>{text ? text : "Default Message"}</ColumnTitle>
      {tasks.map((task) => (
        <Card text={task.text} id={task.id} />
      ))}
      <AddNewItem
        toggleButtonText="+ Add another card"
        onAdd={console.log}
        dark
      />
    </ColumnContainer>
  );
};
