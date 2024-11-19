# NeuroNudge

Autonomous Time Blocking Task Scheduler

## Description

The application integrates with Google Calendar to sync existing commitments like classes and appointments, then retrieves students' tasks and deadlines. It automatically sorts tasks by priority, considering factors like due dates, task length, and importance, and identifies empty time slots in the calendar. Using time blocking, it schedules tasks in available slots based on their urgency, helping students, especially those with ADHD, focus and stay organized. The app sends reminders for tasks and adjusts dynamically when new tasks are added. Additionally, it categorizes tasks and uses machine learning to personalize and optimize the schedule based on user habits and productivity.

## Authors

- Brain Hagerty
- Jake McKnight
- Wesley Johnson
- Matthew Ward




# NeuroNudge

---

***A linear schedule and personal reminder system for autonomous time-blocking and task prioritization to assist students with ADHD.***

Problem:

> Current productivity tools often demand a steep learning curve, making them counterintuitive, especially for ADHD students grappling with time management. As a result, many of these students, already facing organizational challenges, find it hard to consistently utilize and benefit from these tools.


Solution:

> A proactive system that handles time-blocking, task tracking/prioritization, schedule building, and reminder system for the user.


Mission Statement:

> Develop an application tailored for ADHD students, to simplify time management by accepting basic text or voice commands. It uses intuitive natural language to set tasks, events, and reminders. The app will autonomously prioritize tasks, construct schedules, and seek user updates, making time management more accessible and user-friendly for those who find traditional methods challenging.

Elevator Pitch:

> We are developing a linear schedule and personal reminder system, aimed at innovating time management for students with ADHD by facilitating autonomous time-blocking and task prioritization. Our vision is to revolutionizing the lives of students grappling with ADHD, by combining targeted adaptations and strategic mitigation to set a new standard for success in managing their time effectively.

---

### Stakeholders

- [X] [Carly Leonard, Ph.D.](https://www.linkedin.com/in/carly-leonard-674b864)    - CU Denver - Assistant Professor Psyhcology Dept. Behavioral/Cognitive Neuroscience
- [X] [Michelle Hourihan](https://www.linkedin.com/in/michelle-hourihan-60a64b162) - CU Denver - Academic Learning Specialist, Learning Resource Center
- [X] [Gillian Lazzarini M.Ed.](https://www.linkedin.com/in/gillianlazzarini)      - CU Denver - Assistant Director, Disability Resource Center
- [X] [Miranda Minsian](https://www.linkedin.com/in/mirandaminasian)               - Licensed Therapist, EMDR Certified

---

### Our Principles

01. The Reason It All Exists
    - *To provide value to our users*

02. KISS
    - *Keep It Simple, Stupid!*

03. Maintain the Vision
    - *Have a clear vision of the project as a whole*
    - *An easily understood architecture and easily maintained system*

04. What We Produce, Others Will Consume
    - *Always specify, design, document, and implement knowing someone else will have to understand what we are doing*

05. Be Mindful of the Future
    - *Never design yourself into a corner*
    _ *ALWAYS ask "what if"*

06. Plan Ahead for Reuse
    - *Reduces the cost and increases the value of both the reusable components and the systems into which they are incorporated*

07. THINK!
    - *Always place clear and complete thought before action; it will produce better results*

---

# The Problem

### ADHD (Attention-Deficit/Hyperactivity Disorder)

Is generally claimed to be the result of neurological dysfunction in processes associated with the production or use of dopamine and norepinephrine in various brain structures. These pathways are directly responsible for modulating executive function (cognitive control behavior), motivation, reward perception, and working memory.

Below you will find a refined list of what our team believes to be the main challenges of the multifaceted issues related to time management in ADHD individuals.

***
1. Perception of Time (Time Blindness & Task Estimation):

   - Difficulty in accurately perceiving the passage of time, leading to missed deadlines or underestimating the time a task will take.


2. Initiation and Focus (Procrastination & Difficulty Maintaining Focus):

   - Challenges in starting tasks due to various reasons, and once started, difficulty maintaining concentration leading to prolonged task durations.


3. Task Management (Difficulty Prioritizing, Overlooking Tasks, & Overcommitment):

   - Struggles with deciding task urgency, frequently forgetting or sidetracking, and often taking on more tasks than manageable.


4. Impulsivity and Distraction:

   - Making rapid decisions without considering time consequences and getting easily sidetracked, impacting schedules and focus.


5. Routine and Transition (Difficulty with Routine & Transition Troubles):

   - Inconsistency in adhering to routines and challenges in moving between tasks without losing momentum or focus.


---

# Solution: **Neuro-Nudge**


***A linear schedule and personal reminder system for autonomous time-blocking and task prioritization to assist students with ADHD.***


### ABSTRACT:

> Our strategy, which is both simple and effective, is crucial in addressing these common challenges. Instead of facing a daunting list of daily tasks, such as attending classes, studying, doing homework, and writing research papers, we advocate for a linear structured approach of time blocking. This empowers students to master their extensive to-do lists. Recognizing the particular struggles faced by individuals with ADHD, our mission is to assist them in transitioning from a task-centric mindset to one that prioritizes time, thereby simplifying their path to achieving their goals.

### Linear Schedule:
> A linear schedule is a structured, sequential timetable where tasks or events are arranged in a straight line or sequence, from start to finish. This clear and straightforward view of what needs to be done and when is often contrasted with non-linear schedules, where tasks may be more flexible and not follow a strict sequence. For students with ADHD, a linear schedule provides a clear, organized structure to aid in focusing and managing time more effectively.

### Time Blocking:
> Time blocking is a simple yet powerful strategy at the core of solving these issues. Most people create lists of things they need to accomplish throughout their day, from attending classes, studying, and doing homework, to starting a research paper and going to office hours. By partitioning time into blocks and dedicating singular tasks to each one, students can achieve the massive amount of tasks they need to accomplish.


**Integration with Google Calendar**
   - Syncs with calendar to pull in existing commitments (i.e. classes, appointments, meetings, clubs, etc.).

**Task Retrieval**
   - Retrieve the students tasks and assignments, along with their deadlines and any other relevant details.

**Priority Sorting**
   - Automatically sort tasks by priority, taking into account due dates, task length, task importance such as impact on final grade, and the students personal preferences.

**Empty Time Slot Identification**
   - The application will analyze the students calendar and identify the available blocks of time for building the schedule.

**Time Blocking**
   - The application would then automatically block out time in the schedule for each task, based on priority, deadline, and estimate the task duration.
   - It will fill the available slots with the tasks, ensuring that all tasks are scheduled before their deadlines.
management method that will automatically divide your day into blocks of time and assign specific tasks or activities to each block.
   - This will help students with ADHD focus on one thing at a time, reduce stress, anxiety, and make their day more structured and productive.

**Nudges and Alerts**
   - The application would notify you of your time blocked schedule and may allow you to make adjustments as needed.
Send nudges to remind the users when it’s time to start a new task or take a break.

**Dynamic Schedule**
   - If the user manually adds a new task or appointment, the schedule automatically adjusts your time blocks for the day to accommodate the changes.

**Smart Categorization**
   - Automatically categorize tasks into different types as homework, projects, studying, and review.

**Learning and Optimization**
   - Over time, the application may use machine learning to optimize your schedule based on your habits, preferences, and past productivity data.
   - In doing so, it can provide a more personalized and effective time-blocking schedule.


### Linear Schedule

> A structured, sequential timetable where tasks or events are arranged in a straight line or sequence, from start to finish. This allows for a clear and straightforward view of what needs to be done and when. It is often contrasted with non-linear schedules, where tasks may be more flexible and not follow a strict sequence. For students with ADHD, a linear schedule would help provide a clear, organized structure to aid in focusing and managing time more effectively.


### Time Blocking

> This simple and powerful strategy lies at the core to solve these issues. Most people create lists of things they need to accomplish throughout their day in addition to attending classes, studying, doing homework, starting your research paper, going to office hours, etc. By partitioning your time into blocks and dedicating singular tasks to each one enables the student to achieve a massive amount of tasks they needed to accomplish.


1. Perception of Time (Time Blindness & Task Estimation):

   - Visual Representation: Time-blocking provides a clear visual representation of the day, week, or month. By seeing time as blocks, individuals can get a tangible grasp on the passage of time.
   - Clear Boundaries: Allocating specific time blocks for tasks can prevent underestimation. For instance, if a person assumes a task will take 30 minutes but allocates an hour block, they offer themselves a buffer.


2. Initiation and Focus (Procrastination & Difficulty Maintaining Focus):

   - Commitment to Start: Knowing there's a specific time block to begin a task can serve as a prompt or trigger to initiate.
   - Focused Duration: The bounded nature of time blocks creates a set duration for focus. The idea of "I only need to concentrate for this block" can be less overwhelming than an open-ended task.


3. Task Management (Difficulty Prioritizing, Overlooking Tasks, & Overcommitment):

   - Prioritized Allocation: Time-blocking forces individuals to decide which tasks get time slots, helping with prioritization.
   - Visibility: By plotting tasks in blocks, there's a reduced chance of overlooking them. It becomes a visual to-do list.
   - Guard Against Overcommitment: By physically seeing available blocks, one can gauge if they're taking on too much and adjust accordingly.


4. Impulsivity and Distraction:

   - Structured Framework: The structured nature of time-blocking can serve as a counterbalance to impulsivity. Before making impulsive decisions, the individual can refer to their time blocks to see if they can afford the time.
   - Reduced Temptation: Knowing there's a dedicated block for leisure or breaks can deter distractions during work blocks.


5. Routine and Transition (Difficulty with Routine & Transition Troubles):

   - Consistent Routines: Time blocks can help set and solidify daily routines. For example, consistently setting the first block of the morning for a particular task can cement it as a habit.
   - Smooth Transitions: By visually seeing when one task ends and the next begins, it aids in mentally preparing for task-switching. Transition buffers can also be set between blocks.


---

# Project Scope

***
1. Project Purpose and Justification:

   - Nudge is tailor-made for college students with ADHD, offering an integrated time-management tool that combines routines, time-blocking, scheduling, and long-term goal management. Acknowledging the distinct challenges these students face, it also encompasses prioritization, decision-making, and motivation tools. Our aim is to support ADHD students in strategic adaptation and targeted mitigation, while promoting a system of proven strategies to help them realize their aspirations.

    - All features will be designed to require as little maintenance and upkeep from the user as possible.
         - Simple swiping and dials
         - Extrapolate text box input into calendar updates


***
2. Features and Functionality:

   - Vocal Input/Output:
     - TBD - Removed from MVP but is the "next to add"
     - Allow voice input to replace the text box 1:1

   - Routine:
     - Create daily, weekly, or custom routines.
     - Automatic reminders for each activity.
     - Track adherence and completion of routines over time.

   - Time-Blocking:
     - Calendar integration for easy time-blocking.
     - Visual representation of how time is allocated throughout the day/week/month/(TBD).
     - Externalize time.

   - Dynamic Scheduling:
     - Meetings, tasks, assignments, and events.
     - Receive automated suggestions based on priorities.
	
   - Long-term Goals Management:
     - Define goals with sub-tasks and deadlines.
     - Visual progress tracking for each goal.
     - Sync goals with daily routines and schedules.

   - Decision-making Tools:
     - Decision matrix to evaluate and rank options.
     - Visualization tools for decision analysis.
	
   - Motivation Boosters:
     - Visualization of achieved goals and completed tasks.

   - Autonomous Prioritization Mechanisms:
     - Rank tasks based on urgency and importance.
     - "Eisenhower Box" integration for quick task categorization.
     - Alert notifications for high-priority tasks.


***
3. Technical Specifications:

   - Platform Compatibility:
     - Android.
     - Web application accessible from any browser. (TBD)
     - Synchronization across all platforms. (TBD)
	
   - Data Storage and Security:
     - TBD

   - Integrations:
     - Google suite.
     - TBD

***
4. Constraints:
   - Development time: 2 semesters
   - Adherence to all data protection and privacy regulations.
   - We have ADHD


***
5. Assumptions:
   - Target users are college students with ADHD.
   - Users have Gmail accounts.
   - Smartphone or web browser.
   - TBD


***
6. Stakeholders:
   - Carly Leonard, Ph.D. - Cognitive Neuroscientist, University of Colorado Denver
   - Miranda M. - Therapist
   - Michelle Hourihan - Academic Learning Specialist, University of Colorado Denver Learning Resource Center
   - Gillian Lazzarini - Disability Resource Coordinator, CU Denver
   - Users with ADHD


***
7. Milestones:
   - Initial Concept & Design: 1/30/2024
   - Core Development Phase: 2/1 - 3/25/2024
   - Alpha Testing: 2/15 - 3/25/2024
   - Beta Testing and Feedback: 3/25 - 4/15/2024
   - MVP Launch: 4/16/2024


***
8. Review and Approval Mechanisms:
   - Weekly meetings to review progress.
   - Bi-weekly meetings with Dr. Dave Ogle
   - Bi-monthly stakeholder check-ins.
   - Feedback loop post-alpha and beta testing.

---

# Neuro-Nudge Requirements

## Functional Requirements

   - System must be able to:

     - Time Block

     - Estimate task duration and allocate time for task on user’s calendar. **M**

     - Allocate multiple time blocks between present [time] and task due date for larger tasks. **M**

   - System must be able to notify users. **M**
      
     - Users will have the option to be periodically notified to take breaks while studying. **S**

   - System Storage **M**

     - System will have a backend storage system. E.g., Firebase. **M**

   - Users must be able to create and edit tasks within system. **M**

   - Users must be able to input task data in as little as 3 steps. **M**

   - Users must be able to edit task object subsequent to creation. **M**

   - Users must be able to track task status. **M**


## Non-functional Requirements

   - Users must have a smartphone. **M**

   - Smartphone must be capable of hosting widget extensions. **M**



   - Android, must have OS version 12.0 or newer. **M**

   - Users must have a Google account. **M**

     - Users must have a corresponding Google calendar. **M**

     - Users must grant system access to Google calendar. **M**

   - Security **M**

     - System must comply with the Colorado Privacy Act (CPA) **M**


# Assumptions

  - Users will be familiar with technology such that the only instruction necessary will be that of how to use the app.

  - The primary demographic of people using this application will be college students with ADHD.
   
  - Users has their smartphone on and nearby. **S**

  - Smartphone must have a minimum of 15 MB available storage. **M**

  - Users must have a microphone on their phone or connected to their phone. **M**


# Constraints

  - The Neuro-Nudge system will act as a reminder and scheduling tool. It is meant as an aid to college students with ADHD but cannot guarantee academic success.

# Dependencies

  - In order for Neuro-Nudge to be an effective tool, users must be able to follow through with tasks and adhere to curated scheduling. **M**


Color-code key (MoSCoW):
   - M : Must Have
   - S : Should Have
   - C : Could Have
   - W : Won’t Have


### Non-functional Requirements

    - Users must have
      - A smartphone.
      - Smartphone must be capable of hosting widget extensions
      - A microphone on their phone or connected to their phone.
      - (Will need more specifics, i.e., phone model, OS version, etc)
      - Google account.
      - A corresponding Google calendar.
      - Must grant system access to Google calendar.


### Functional Requirements

    - Users must be able to
      - create and edit tasks within system.
      - input task data in as little as (arbitrary number) steps.
      - edit task object subsequent to creation. M
      - input data using voice recognition software. S
      - system from the home or lock screen on smartphone. C
      - track task status.

    - System must be able to
      - estimate task duration and allocate time for task on user’s calendar.
      - take tasks estimated to take more than (arbitrary number) hours and allocate multiple time blocks between present and task due date.
      - implement task prioritization functionality that allows the user to assign low, medium, and high priority labels to tasks. S
      - adjust task priority based on proximity to task deadline.
      - notify users.
    
    - Users must have smartphone on and nearby.
    - Users will have the option to be periodically notified to take breaks while studying.



Requirement Validation Steps:

Is each requirement consistent with the overall objective for the system/product?

Have all requirements been specified at the proper level of abstraction? That is, do some requirements provide a level of technical detail that is inappropriate at this stage?

Is the requirement really necessary or does it represent an add-on feature that may not be essential to the objective of the system?

Is each requirement bounded and unambiguous?

Does each requirement have attribution? That is, is a source (generally, a specific individual) noted for each requirement?

Do any requirements conflict with other requirements?

---

# Timeline / Milestones


## August

- [X] Project idea development
- [x] Research phase
- [x] Identify Stakeholders
  - [x] Reach out and schedule meetings

## September

- [x] Meet with stakeholders
- [x] Take input and refine project scope and develop requirements
- [x] Explore tech stack requirements - User Data Storage / Google API Compatibility

## October

### Week 8

**Oct. 9 - 15**

***Meeting w/ Dave 10.09***

*Tasks for the Week Ahead*
- [x] Timeline
- [x] Define features
- [x] Define functionality

### Week 9

**Oct. 16 - 22**

*Tasks for the Week Ahead*
- [x] Features and functionality mapped to requirements
- [x] Researching Tech Stack Options
- [x] Setup meetings with stakeholders to propose functionality

### Week 10

**Oct. 23 - 29**

***Meeting w/ Dave 10.23***

*Tasks for the Week Ahead*
- [x] Finalize Tech Stack:
  - [x] Validate chosen: technologies, platforms, and tools you'll use for development.
  - [x] Document Updates
- [x] High-Level Design (HLD):
  - [x] System Architecture: High-level architecture diagram of components/modules of the software and their interactions.
  - [x] Define Interfaces: Specify how different system components will communicate with each other.
- [x] Validate Design with stakeholders - iterate if needed

## November

### Week 11

**Oct. 30 - Nov. 5**

*Tasks for the Week Ahead*
- [x] Low-Level Design (LLD):
  - [x] Component Design: detailed functionality for components/modules defined in the HLD.
  - [x] Data Model Design:
    - [ ] Create UML diagram, database schemas, ER(R) diagrams, and specify data flow.
- [ ] Algorithm Selection/Design:
  - [ ] Validate choices
  - [ ] Verify success
- [x] Interface Design: Define APIs, protocols, and data formats.
- [ ] UI/UX Design: layouts, colors, and graphics.
  - [ ] Verify w/ Stakeholders

### Week 12

**Nov. 6 - 12**

***Meeting w/ Dave 11.06***

*Tasks for the Week Ahead*
- [ ] Prototyping:
  - [ ] Create mockup or prototype of the software. Clickable interface or minimal version of the software to visualize the design and user flow.
- [ ] Design Review:
  - [ ] Conduct design review sessions with peers, technical experts, and stakeholders.
  - [ ] Validate the design against the requirements to ensure that it addresses all needs.
  - [ ] Identify potential flaws, bottlenecks, or areas for optimization.
- [ ] Design Documentation:
  - [x] Document the design decisions, architecture, data models, interfaces, etc.

### Week 13

**Nov. 13 - 19**

***Meeting w/ Dave 11.13***

*Tasks for the Week Ahead*
- [ ] Implementation:
  - [x] Development/coding phase.
  - [ ] Test

### Week 14

**Nov. 20 - 26**

***Fall Break: No Days Off***

*Tasks for the Week Ahead*
- [ ] Implementation Continued:
  - [x] Development/coding phase continued.
  - [ ] Test

## December

### Week 15

**Nov. 27 - Dec. 3**

***Meeting w/ Dave 12.04***

***NOTE: 3 Week update since last meeting w/Dave***
- *We will have a lot of work done to show Dave*

*Tasks for the Week Ahead*
- [ ] Testing Considerations:
  - [ ] Test components.
  - [ ] Identify areas where unit tests, integration tests, and system tests will be necessary.

### Week 16

**Dec. 11 - 17**

***Meeting w/ Dave?***

- [ ] MVP

## January

- [ ] Meet w/ Dave
- [ ] Meet w/ Stakeholders
- [ ] Review, Refine, Repeat

## February

## March

## April

- [ ] Finalize implementation
- [ ] Prepare presentation

## May

- [ ] Presentation - 5/1-5/3?
- [ ] Win

---

# Features & Functionality

**Integration with Google Calendar**
   - Syncs with calendar to pull in existing commitments (i.e. classes, appointments, meetings, clubs, etc.).

**Task Retrieval**
   - Retrieve the students tasks and assignments, along with their deadlines and any other relevant details.

**Priority Sorting**
   - Automatically sort tasks by priority, taking into account due dates, task length, task importance such as impact on final grade, and the students personal preferences.

**Empty Time Slot Identification**
   - The application will analyze the students calendar and identify the available blocks of time for building the schedule.

**Time Blocking**
   - The application would then automatically block out time in the schedule for each task, based on priority, deadline, and estimate the task duration.
   - It will fill the available slots with the tasks, ensuring that all tasks are scheduled before their deadlines.
management method that will automatically divide your day into blocks of time and assign specific tasks or activities to each block.
   - This will help students with ADHD focus on one thing at a time, reduce stress, anxiety, and make their day more structured and productive.

**Nudges and Alerts**
   - The application would notify you of your time blocked schedule and may allow you to make adjustments as needed.
Send nudges to remind the users when it’s time to start a new task or take a break.

**Dynamic Schedule**
   - If the user manually adds a new task or appointment, the schedule automatically adjusts your time blocks for the day to accommodate the changes.

**Smart Categorization**
   - Automatically categorize tasks into different types as homework, projects, studying, and review.

**Learning and Optimization**
   - Over time, the application may use machine learning to optimize your schedule based on your habits, preferences, and past productivity data.
   - In doing so, it can provide a more personalized and effective time-blocking schedule.
   
   
   
   

# Technology Stack for Neuro-Nudge App

## 1. Frontend
- **[Flutter](https://flutter.dev/)**
  - Framework for mobile app UI development.

## 2. Backend
- **2.1. [Supabase](https://supabase.com/)**
  - An open source Firebase alternative.
    - Postgres database, Authentication, instant APIs, Edge Functions, Realtime subscriptions, Storage, and Vector embeddings.
- **2.2. [OpenAI API](https://platform.openai.com/overview)**
  - [Assistants API](https://platform.openai.com/docs/assistants/overview) [Beta], to build AI assistants capable of performing a variety of tasks to assist the user.
- **2.3. [Node.js](https://nodejs.org/en)**
- **2.4. [OpenAI-Node](https://github.com/openai/openai-node):** To work in tandem with Supabase, Node.js, and OpenAI

## 3. State Management
- **Back Up Plan**
  - **[Redux](https://redux.js.org/) or [MobX](https://mobx.js.org/README.html):** For managing app state.
  - **[ReactManaging State](https://react.dev/learn/managing-state):** Alternative for simpler state management.

## 4. Navigation
- **[React Navigation](https://reactnavigation.org/):** For screen navigation within the app.

## 5. Voice Recognition and Control
- **5.1. OpenAI API**
  - **[OpenAPI TTS API](https://platform.openai.com/docs/guides/text-to-speech):** Text-to-Speech
  - **[OpenAPI STT API](https://platform.openai.com/docs/guides/text-to-speech):** Speech-to-Text
- **5.2. Back Up Options**
  - **[React Native Voice](https://github.com/react-native-voice/voice):** For voice recognition.
  - **[React Native TTS](https://github.com/ak1394/react-native-tts) (Text-to-Speech):** For voice feedback.

## 6. **Calendar Integration**
- **[React Native Calendars](https://github.com/wix/react-native-calendars):** Customizable calendar components.
- **[Google Calendar API](https://developers.google.com/calendar):** For syncing with Google Calendar.

## 7. **User Interface & UX**
- **[React Native Paper](https://callstack.github.io/react-native-paper/) or [gluestack-ui](https://gluestack.io/ui/docs/overview/introduction):** UI toolkits for building interfaces.
- **[Figma]():** UI toolkits
- **[Lottie for React Native](https://airbnb.design/lottie/):** For advanced animations.

## 8. **Machine Learning (For Optimization)**
- **[Firebase ML](https://firebase.google.com/products/ml):** For basic machine learning capabilities.
- **[TensorFlow.js](https://www.tensorflow.org/js):** For more complex ML tasks.

## 9. **Testing and Quality Assurance**
- **[Jest](https://jestjs.io/):** For unit testing.
- **[Detox](https://github.com/wix/Detox):** For end-to-end testing.

## 10. **Continuous Integration and Deployment**
- **[Fastlane](https://fastlane.tools/):** For automated app deployment.
- **[GitHub Actions](https://github.com/features/actions) or [Bitrise](https://bitrise.io/):** For continuous integration.

## 11. **Error Monitoring and Logging**
- **[Sentry](https://sentry.io/welcome/) or [Firebase Crashlytics](https://firebase.google.com/products/crashlytics):** For monitoring and logging errors.

## 12. **Analytics**
- **[Firebase Analytics](https://firebase.google.com/products/analytics):** For app usage data and metrics.

## 13. **Accessibility**
- **[Accessibility APIs in React Native](https://reactnative.dev/docs/accessibility):** To ensure the app is accessible to all users.

## 14. **Other Tools and Services**

[Project Homepage](https://github.com/ucd-seniorDesign2324)

- **Version Control:** Git with GitHub
- **Project Management:** [GitHub Orgs: UCD Senior Design ’23/’24](https://github.com/orgs/ucd-seniorDesign2324/projects)




# High Level Design


## Client Side (Flutter)

### User Interface
- **Customizable Views:** Interfaces for creating, viewing, and editing linear schedules and time blocks, tailored for ADHD needs (e.g., simple, distraction-free, color-coded).
- **Task and Event Components:** Components for tasks/events that allow easy time blocking and prioritization.
- **Reminders and Notifications:** Interface to set and manage personal reminders.

### User Experience
- **ADHD-Friendly Design:** Minimize cognitive load and distractions.
- **Personalization:** Customize views and settings to user preferences.

## Voice Integrated Control and Text-to-Speech
- **Voice Command Recognition:** Allows users to interact with the app using voice commands for tasks like scheduling, setting reminders, and viewing tasks.
- **Speech Synthesis (Text-to-Speech):** Provides audible feedback and responses, reading out schedules, reminders, and task details.

## Backend (Firebase)

### Firestore Database
- **User Profiles:** Store user-specific settings, preferences, and ADHD-specific needs.
- **Schedule Data:** Store information about schedules, tasks, and time blocks.
- **Reminders:** Manage reminders and notification settings.

## External APIs

### Google Calendar API
- **Integration with Personal Calendars:** Link users' Google Calendars for comprehensive schedule management.
- **Syncing with App Data:** Ensure consistency between app's scheduling data and Google Calendar.

### OpenAI API
- **Integration with Google Calendars:** Link users' Google Calendars for comprehensive schedule management.
- **Syncing with App Data:** Ensure consistency between app's scheduling data and Google Calendar.
- **Text-to-Speech (TTS) and Speech-to-Text (STT):** For voice enabled control.
- **Knowledge Retrieval:** *see Nice-to-Have*

## Communication Flow
- **App ↔ Firebase ↔ Google Calendar API:** Communication for authentication, data storage, and retrieval, syncing with Google Calendar.
- **App ↔ Firebase ↔ OpenAI API:** Communication for data storage, retrieval, TTS, STT, Assistant API, syncing with Google Calendar.

## Specific Features for ADHD

### Time Blocking
- **Linear Time Blocks:** Create linear, non-overlapping time blocks for tasks and activities.
- **Visual Indicators:** Represent different types of activities or priority levels.

### Task Prioritization
- **Drag-and-Drop Interface:** Rearrange tasks easily for prioritization.
- **Color Coding:** Differentiate priorities through color coding.

### Reminders and Notifications
- **Customizable Reminders:** Set multiple reminders for tasks.
- **Smart Notifications:** Notifications that adapt to user behavior and preferences.

## Accessibility and Inclusivity
- **User Testing:** Involve students with ADHD in design and testing.
- **Customizable Interface:** Adjust text sizes, colors, and other elements for accessibility.

## Data Privacy and Security
- **Compliance with Regulations:** Adhere to data protection laws, considering the target demographic.
- **Secure Data Handling:** Implement robust security measures for user data.

## Performance and Scalability
- **Lightweight Operations:** Optimize for fast loading and smooth interactions.
- **Scalable Architecture:** Design to handle varying numbers of users and data volumes.

***

## Nice-to-Haves
- **[Knowledge Retrieval](https://platform.openai.com/docs/assistants/tools/knowledge-retrieval):** Augments the OpenAI Assistant API with knowledge from outside the model (e.g. documents provided by the user, automatically chunk your docs,, index, and store the embeddings, and implement a vectorDB to retrieve content to answer user queries).



Page 09 - Components and Modules


# Neuro-Nudge - App Components Breakdown with Voice Control

## 1. **Calendar Integration Component**
- **Google Calendar Sync Service:**
  - Syncs with Google Calendar to pull in existing commitments.
  
## 2. **Task Management Component**
- **Task Retrieval Service:**
  - Fetches tasks, assignments, deadlines, and details.
- **Priority Sorting Algorithm:**
  - Algorithmically sorts tasks by various factors.

## 3. **Scheduling Engine**
- **Empty Slot Identification Module:**
  - Identifies available time slots in the calendar.
- **Time Blocking Scheduler:**
  - Schedules tasks based on priority and deadlines.

## 4. **Notification and Nudge System**
- **Alerts and Notifications Manager:**
  - Manages reminders and notifications for the scheduled tasks.

## 5. **Dynamic Scheduling Component**
- **Real-time Scheduler:**
  - Adjusts time blocks in response to new tasks or changes.

## 6. **Task Categorization Engine**
- **Automatic Categorization Module:**
  - Categorizes tasks into predefined types.

## 7. **Machine Learning and Optimization Component**
- **Data Analysis and Learning Module:**
  - Optimizes scheduling based on user data and feedback.

## 8. **User Interface**
- **Front-End Application:**
  - Interface for user interaction, visualization, and input.

## 9. **Voice Control Component**
- **Voice Command Interface:**
  - Allows users to interact with the app using voice commands.
- **Speech Recognition Engine:**
  - Processes and interprets user voice inputs.
- **Voice Feedback System:**
  - Provides audible feedback and responses to user queries.

## 10. **Backend Services**
- **Database and Storage:**
  - Stores user data, task details, and preferences.
- **Server-Side Processing:**
  - Handles complex computations, data synchronization, and voice command processing.

## 11. **Security and Privacy Layer**
- **Data Protection and Encryption:**
  - Ensures the security and privacy of user data.
- **Access Control and Authentication:**
  - Manages user access and permissions.

## Interaction Flow
1. **Data Sync and Retrieval:** Syncs with calendars and retrieves tasks.
2. **Scheduling and Optimization:** Sorts, categorizes, and schedules tasks.
3. **User Interaction:** Users interact using UI or voice commands.
4. **Dynamic Rescheduling:** System adjusts to new inputs and voice commands.
5. **Learning and Adaptation:** Optimizes future scheduling based on user behavior and voice command patterns.



XX. Citations & Research


***rough draft, not finalized and/or not all sources used for project at this time***

**last updated: 10.31.23**
**MW**

Ways to learn
https://www.learningscientists.org/

Interleaving Improves Mathematics
https://psycnet.apa.org/record/2014-44133-001

Learning Concepts and Categories: Is Spacing the “Enemy of Induction”?
https://journals.sagepub.com/doi/abs/10.1111/j.1467-9280.2008.02127.x

Practice Makes Perfect: The Critical Role of Mixed Practice in the Acquisition of ECG Interpretation Skills
https://link.springer.com/article/10.1023/A:1022687404380

Contextual Interference Effects in Learning Three Badminton Serves
https://www.tandfonline.com/doi/abs/10.1080/02701367.1986.10608091?journalCode=urqe20

Retrieval Practice Guide
https://pdf.retrievalpractice.org/RetrievalPracticeGuide.pdf

Cornell Note-Taking Strategies
https://canvas.cornell.edu/courses/1451
