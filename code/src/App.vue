<template>
  <div id="app">
    <div class="header">
      <img src="@/assets/logo.png" alt="Vue.js Logo" class="vue-logo" />
      <h1>Task Tracker</h1>
    </div>
    <task-list :tasks="tasks" @addTask="addTask" @deleteTask="deleteTask" @editTask="editTask" />
  </div>
</template>

<script>
import TaskList from './components/TaskList.vue';

export default {
  name: 'App',
  components: {
    TaskList,
  },
  data() {
    return {
      tasks: [],
    };
  },
  methods: {
    addTask(newTask) {
      this.tasks.push(newTask);
    },
    deleteTask(index) {
      this.tasks.splice(index, 1);
    },
    editTask(index, updatedTask) {
      this.tasks[index] = updatedTask;
    },
  },
};
</script>

<style>
#app {
  text-align: center;
  margin-top: 20px;
}

.header {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}

h1 {
  margin-right: 20px;
}

.vue-logo {
  width: 100px;
  height: 100px;
}
</style>
