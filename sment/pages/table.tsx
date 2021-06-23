import { useState, useEffect } from 'react';
import axios from 'axios'

export default function table() {
	return (
		<div>
			<SmentHeader />
			<TeamTable />
			<MemberTable />
			<RecordsTable />
		</div>
	)
}

const SmentHeader = () => {
	return (
		<h1>SM엔터테이먼트</h1>
	)
}

const TeamTable = () => {
	const [units, setUnits] = useState([])
	
	const fetchSment = async () => {
		try {
			const res = await axios.get('https://sm-entdb-xakdo.run.goorm.io/api/team')
			setUnits(res.data)
		} catch (err) {
			console.log(err)
		}
	}
	
	useEffect(() => {
		fetchSment()
	}, [])
	
	return (
		<table>
			<tr>
				<th>그룹 이름</th>
				<th>멤버 수</th>
				<th>데뷔일</th>
				<th>리더</th>
				<th>팬덤</th>
			</tr>
			{units.map((unit, index) => 
				<tr key={index}>
					<td>{unit.tname}</td>
					<td>{unit.members}명</td>
					<td>{unit.debut}</td>
					<td>{unit.leader}</td>
					<td>{unit.fandom}</td>
				</tr>
			)}
		</table>
	)
}

const MemberTable = () => {
	const [units, setUnits] = useState([])
	
	const fetchSment = async () => {
		try {
			const res = await axios.get('https://sm-entdb-xakdo.run.goorm.io/api/member')
			setUnits(res.data)
		} catch (err) {
			console.log(err)
		}
	}
	
	useEffect(() => {
		fetchSment()
	}, [])
	
	return (
		<table>
			<tr>
				<th>프로필 사진</th>
				<th>이름</th>
				<th>생일</th>
				<th>포지션</th>
				<th>소속 그룹</th>
			</tr>
			{units.map((unit, index) => 
				<tr key={index}>
					<td className='image'><img src={`https://sm-entdb-xakdo.run.goorm.io/images/${unit.filename}`} className='profile'/></td>
					<td>{unit.mname}</td>
					<td>{unit.birthday}</td>
					<td>{unit.position}</td>
					<td>{unit.tname}</td>
				</tr>
			)}
		</table>
	)
}

const RecordsTable = () => {
	const [units, setUnits] = useState([])
	
	const fetchSment = async () => {
		try {
			const res = await axios.get('https://sm-entdb-xakdo.run.goorm.io/api/records')
			setUnits(res.data)
		} catch (err) {
			console.log(err)
		}
	}
	
	useEffect(() => {
		fetchSment()
	}, [])
	
	return (
		<table>
			<tr>
				<th>제목</th>
				<th>그룹</th>
			</tr>
			{units.map((unit, index) => 
				<tr key={index}>
					<td>{unit.title}</td>
					<td>{unit.tname}</td>
				</tr>
			)}
		</table>
	)
}