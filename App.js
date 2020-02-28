/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {PureComponent} from 'react';
import {
  SafeAreaView,
  StyleSheet,
  ScrollView,
  View,
  Text,
  StatusBar,
  Dimensions
} from 'react-native';

import {
  Header,
  LearnMoreLinks,
  Colors,
  DebugInstructions,
  ReloadInstructions,
} from 'react-native/Libraries/NewAppScreen';
import ZZPlayerView from './ZZ/ZZPlayerView';

class App extends PureComponent {
  render() {
    return (
      <View style={{flex: 1, backgroundColor: 'white'}}>
        <SafeAreaView>
          <View>
            <ZZPlayerView
              style={{height: 200, backgroundColor: 'red'}}
              ref={c => (this.playRef = c)}
              url={
                'http://vfx.mtime.cn/Video/2019/02/04/mp4/190204084208765161.mp4'
              }
            />
            <View style={{height: 50}} />
            <Text onPress={() => this._action(1)} style={{color: 'black'}}>
              play
            </Text>
            <View style={{height: 50}} />
            <Text onPress={() => this._action(2)}>pause</Text>
            <View style={{height: 50}} />
            <Text onPress={() => this._action(3)}>resume</Text>
            <View style={{height: 50}} />
            <Text onPress={() => this._action(4)}>stop</Text>
          </View>
        </SafeAreaView>
      </View>
    );
  }
  _action = index => {
    switch (index) {
      case 1:
        this.playRef.play();
        break;
      case 2:
        this.playRef.pause();
        break;
      case 3:
        this.playRef.resume();
        break;
      case 4:
        this.playRef.stop();
        break;
    }
  };
}

const styles = StyleSheet.create({
  scrollView: {
    backgroundColor: Colors.lighter,
  },
  engine: {
    position: 'absolute',
    right: 0,
  },
  body: {
    backgroundColor: Colors.white,
  },
  sectionContainer: {
    marginTop: 32,
    paddingHorizontal: 24,
  },
  sectionTitle: {
    fontSize: 24,
    fontWeight: '600',
    color: Colors.black,
  },
  sectionDescription: {
    marginTop: 8,
    fontSize: 18,
    fontWeight: '400',
    color: Colors.dark,
  },
  highlight: {
    fontWeight: '700',
  },
  footer: {
    color: Colors.dark,
    fontSize: 12,
    fontWeight: '600',
    padding: 4,
    paddingRight: 12,
    textAlign: 'right',
  },
});

export default App;
