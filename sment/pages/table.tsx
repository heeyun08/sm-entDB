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

// const units = [
//   { name: "에스파", leader: "카리나" },
//   { name: "엑소", leader: "수호" },
//   { name: "소녀시대", leader: "태연" }
// ]

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
				<th>이름</th>
				<th>생일</th>
			</tr>
			{units.map((unit, index) => 
				<tr key={index}>
					<td>{unit.name}</td>
					<td>{unit.birthday}</td>
				</tr>
			)}
		</table>
	)
}