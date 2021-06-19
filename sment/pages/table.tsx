import { useState, useEffect } from 'react';
import axios from 'axios'

export default function table() {
	return (
		<div>
			<SmentHeader />
			<SmentTable />
		</div>
	)
}

const SmentHeader = () => {
	return (
		<h1>SM엔터테이먼트</h1>
	)
}

const SmentTable = () => {
	const [units, setUnits] = useState([])
	
	const fetchSment = async () => {
		try {
			const res = await axios.get('https://sm-entdb-xakdo.run.goorm.io/api/sment')
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
				<th>이미지</th>
				<th>이름</th>
				<th>생일</th>
				<th>소속그룹</th>
			</tr>
			{units.map((unit, index) => 
				<tr key={index}>
					<td><img src={`https://sm-entdb-xakdo.run.goorm.io/images/${unit.filename}`} className='profile'/></td>
					<td>{unit.mname}</td>
					<td>{unit.birthday}</td>
					<td>{unit.tname}</td>
				</tr>
			)}
		</table>
	)
}