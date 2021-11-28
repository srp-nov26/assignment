import React, { Component } from 'react'

class Event extends Component {
    constructor(props) {
        super(props);
   
        this.state = {
            events: [],
            DataisLoaded: false
        };
    }
   
    componentDidMount() {
        fetch(
            "http://localhost:4000/users/1/events")
            .then((res) => res.json())
            .then((json) => {
                this.setState({
                    events: json,
                    DataisLoaded: true
                });
            })
    }
    render() {
        const { DataisLoaded, events } = this.state;
        if (!DataisLoaded) return <div>
            <h1> Pleses wait some time.... </h1> </div> ;
        else {
            return (
                <div className = "App">
                    {
                        events.map((event) => ( 
                        <ol key = { event.id } >
                            Title: { event.title }, 
                            Start_time: { event.starttime }, 
                            End_Time: { event.endtime },
                            Description: { event.description },
                            RSVP: { event.rsvp }, 
                            All_day: { event.allday },
                            </ol>
                        ))
                    }
                </div>
            );
        }
    }       
}

export default Event;