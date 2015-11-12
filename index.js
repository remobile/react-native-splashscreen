/*
* (The MIT License)
* Copyright (c) 2015-2016 YunJiang.Fang <42550564@qq.com>
* @providesModule splashscreen
* @flow-weak
*/
'use strict';

var React = require('react-native');
var {
    View,
    Text,
} = React;

module.exports = React.createClass({
    render() {
        return (
            <View style={{flex:1, justifyContent: 'center', alignItems: 'center',}}>
                <Text>
                    come soon
                </Text>
            </View>
        )
    }
});
