;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QUBKV^INT^1^59547,73884^0
%QUBKV(IN,REF) ;;04:45 PM  21 Feb 1992;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N LI,RESI,RESA
 S LI=@GL@("A")
 S RESI=$$^%QUBKVI(GL,LI,REF)
 D ^%QUBKVA(RESI)
 S RESA=$$^%QUBKVR(RESI)
 D END^%QUBKVI(RESI)
 Q RESA
 
 
TEST 
 N GL,LIS
 S GL("X")=0,GL("Y")=3,GL("L")=78,GL("H")=8,GL("TI")="Attributs affiches"
 S z=0
 F i=1:1:3 S GL("FEN",i,"L")=24,GL("FEN",i,"D")=((i-1)*5)+1,GL("FEN",i,"F")=i*5 F j=1:1:5 S z=z+1,GL("LI",z,"T")="m"_i_j,GL("LI",z,"L")=5+$R(8),GL("LI",z,"U")="OK^%QUBK3"
 F nblig=1:1:6 S LIS(nblig)="" F i=1:1:3 F j=1:1:5 S LIS(nblig)=LIS(nblig)_"v"_nblig_i_j_"^"
 S GL("A")="LIS"
 D CLEPAG^%VVIDEO
 S IN="GL"
 S RESA=$$^%QUBKV(IN,0)
 Q
OK(R) S OK=1 Q
 
 
TEST2 N GL,LIS
 S GL=$$TEMP^%SGUTIL,LIS=$$TEMP^%SGUTIL
 S @GL@("X")=0,@GL@("Y")=3,@GL@("L")=78,@GL@("H")=8,@GL@("TI")="Tableur"
 S @GL@("FEN",1,"L")=26,@GL@("FEN",1,"D")=1,@GL@("FEN",1,"F")=2
 S @GL@("FEN",2,"L")=46,@GL@("FEN",2,"D")=3,@GL@("FEN",2,"F")=6
 F z=1:1:2 S @GL@("LI",z,"L")=12,@GL@("LI",z,"U")="OKMATH^%QUBK3"
 F z=3:1:6 S @GL@("LI",z,"L")=15,@GL@("LI",z,"U")="OKMATH^%QUBK3"
 S @GL@("LI",1,"T")="operateur 1",@GL@("LI",2,"T")="operateur 2",@GL@("LI",3,"T")="addition",@GL@("LI",4,"T")="soustraction",@GL@("LI",5,"T")="multiplication",@GL@("LI",6,"T")="division"
 F nblig=1:1:20 S @LIS@(nblig)="^^^^^^^^"
 S @GL@("A")=LIS
 D CLEPAG^%VVIDEO
 S RR=$$^%QUBKV(GL,GL_"|"_LIS)
 K @(GL),@(LIS)
 Q
OKMATH(R) 
 N V1,V2,GL,LIS
 S GL=$P(R,"|"),LIS=$P(R,"|",2)
 I COLCOUR>2 S OK=0 Q
 I COLCOUR=2,$P(@LIS@(LIGCOUR),"^")="" S OK=0 Q
 I COLCOUR=1,LIGCOUR>1,$P(@LIS@(LIGCOUR-1),"^",2)="" S OK=0 Q
 I COLCOUR=1,$P(@LIS@(LIGCOUR),"^",2)="" S OK=1 Q
 S V1=$S(COLCOUR=1:Y1,1:$P(@LIS@(LIGCOUR),"^")),V2=$S(COLCOUR=1:$P(@LIS@(LIGCOUR),"^",2),1:Y1)
 S @LIS@(LIGCOUR)=V1_"^"_V2_"^"_(V1+V2)_"^"_(V1-V2)_"^"_(V1*V2)_"^"_(V1/V2)
 S (OK,REAF)=1 Q
 ;

