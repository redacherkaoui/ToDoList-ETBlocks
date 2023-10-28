// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Todo {
  struct Task {
    uint id;
    uint date;
    string content;
    string author;
    bool done;
  }

  uint lastTaskId;
  uint[] taskIds;
  mapping(uint => Task) tasks;

  event TaskCreated(uint, uint, string, string, bool);

  constructor() {
    lastTaskId = 0;
  }

  function createTask(string memory _content, string memory _author) public {
    lastTaskId++;
    tasks[lastTaskId] = Task(lastTaskId, block.timestamp, _content, _author, false);
    taskIds.push(lastTaskId);
    emit TaskCreated(lastTaskId, block.timestamp, _content, _author, false);
  }

  function getTaskIds() public view returns (uint[] memory) {
    return taskIds;
  }

  function getTask(uint id) public view tasksExists(id)
    returns (
      uint,
      uint,
      string memory,
      string memory,
      bool
    )
  {
    return (
      id,
      tasks[id].date,
      tasks[id].content,
      tasks[id].author,
      tasks[id].done
    );
  }

  modifier tasksExists(uint id) {
    if (tasks[id].id == 0) {
      revert();
    }
    _;
  }
}
