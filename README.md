# Resume App
This is a Ruby on Rails app that generates a resume.

## Features
* Generates a resume based on a given YML file.  It will have the following format:

        TITLE:
        TARGET:
        SECTIONS:
          OBJECTIVE: ''
          SKILLS:
            <<SKILLSET NAME>>:
              - 'skill 1'
              ...
              - 'skill N'
          EXPERIENCE:
            - TITLE: ''
              DEPARTMENT: ''
              COMPANY: ''
              START_DATE: YYYY-MM-DD
              END_DATE: YYYY-MM-DD
              ITEMS:
                - 'bullet item 1'
                ...
                - 'bullet item N'
            ...
          ASSOCIATIONS:
            - 'association 1'
            ...
            - 'association N'
          EDUCATION:
            - 'education 1'
            ...
            - 'education N'
            
