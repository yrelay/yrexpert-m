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

;%VMULTGE^INT^1^59547,74035^0
GEMULTGE(IFLAG) 
 
 K m,%NUM,FRESU,AFRESU S m("DEB")=1,m("%N")=NOMTAB_"(",m("NPT")=0,IFLAG=0,m("AB")="AB" K A S ICX=0
 F J=1:1 Q:'($D(^%SCRE(SCR,J)))  I $D(^%SCRE(SCR,J))=11 S m("NPT")=m("NPT")+1,m(m("AB"),m("NPT"))=RESUL(J),m("CLE",m("NPT"))=J I $D(^%SCRE(SCR,J,"INVISIBLE")),RESUL(J)'="" S m("FULL",J)=RESUL(J)
 D DECOMP S m("AB")="B" F ZZ1=1:1:m("NPT") S m("B",ZZ1)=m("AB",ZZ1)
L F %P=m("DEB"):1:m("NPT") S C=m("%N")_""""_m(m("AB"),%P)_""")",(E,m("B",%P))=$N(@C) S:m("AC",%P)="" m("ACC",%P)=$E(E,1) S CA=$S(m("AC",%P)="":"ACC",1:"AC") D TE G S:m("GOS") D S1
 S %NOMC=NOMTAB_"(" F %Q=1:1:m("NPT") S %NOMC=%NOMC_""""_m("B",%Q)_""","
 S %NOMC=$E(%NOMC,1,$L(%NOMC)-1)_")"
 S m("%N")=$E(m("%N"),1,$L(m("%N"))-1)_")" D GOLDNOM(m("%N"),.OLDNOM,.OLDFULL)
 I $D(@m("%N"))=10 D RESLG(m("%N"),.SCR,.RESUL),^%VTNAMFU S %FNOM=%NFU_"("_$P(m("%N"),"(",2) D:%NFU'="" RESLG(.%FNOM,.SCR,.AFRESU) S m("%N")=m("%N",%P),m("DEB")=m("NPT"),m("AB")="B" G FIN
 E  S RS=@m("%N") F IW=1:1:m("NPT") S RESUL(m("CLE",IW))=m("B",IW),AFRESU(m("CLE",IW))=RESUL(m("CLE",IW))
 K FRESU D RESAUTG(.RS,.SCR,.RESUL),^%VTNAMFU
 I %NFU'="" S %FNOM=%NFU_"("_$P(m("%N"),"(",2,999) I $D(@%FNOM) S FRS=@%FNOM D RESAUTG(.FRS,.SCR,.AFRESU) G VV
 D RESAUTG(.RS,.SCR,.AFRESU)
VV S m("%N")=m("%N",%P),m("DEB")=m("NPT"),m("AB")="B"
 
 S m("iv")="" F m("ii")=1:1 S m("iv")=$O(^%SCREC(SCR,"GERQS",m("iv"))) Q:m("iv")=""  S m("ex")="S RESUL(m(""iv""))="_^%SCREC(SCR,"GERQS",m("iv")) X m("ex") S AFRESU(m("iv"))=RESUL(m("iv"))
 G FIN
S I %P=1,(m("B",1)=-1)!('($D(m("%NUM2",%P)))) S IFLAG=-2 G FIN
 I $D(m("%NUM2",%P)),m("B",%P)'=-1 D ^%VMULENT S m("DEB")=%P G L
 F UU=%P:1:m("NPT") S m("B",UU)=m("AB",UU) S:$D(m("%NUM",UU)) m("%NUM2",UU)=1
 S:%P'=1 %P=%P-1 S m("AB")="B",m("DEB")=%P,m("%N")=m("%N",%P) G L
 Q
S1 S m("%N",%P)=m("%N"),m("%N")=m("%N")_""""_m("B",%P)_"""," Q
DECOMP F Z1=1:1:m("NPT") D TRAIT
 Q
TE S m("GOS")=0 I (m("B",%P)=-1)!($E(m("B",%P),1,m("%8",%P))'=m(CA,%P)) S m("GOS")=1 G TEF
 I $D(m("FULL",%P)),m("FULL",%P)'=m("B",%P) S m("GOS")=1
TEF Q
TRAIT S ISNUM=0,(%PCH,SCH)=m("AB",Z1) I $E(SCH,$L(SCH))="." S %PCH=$E(%PCH,1,$L(%PCH)-1) I %PCH'["." S ISNUM=$$ISN(%PCH) I ISNUM S %PCH=SCH
 S:'(ISNUM) ISNUM=$$ISN(%PCH) S m("%8",Z1)=$L(SCH) I ISNUM S m("AC",Z1)=SCH,m("AB",Z1)=$S(SCH'[".":SCH-1,1:"?") D:m("AB",Z1)="?" DEC S m("%NUM",Z1)=1,m("%NUM2",Z1)=1 Q
 S m("AC",Z1)=SCH S:SCH'="" AM=$E(SCH,m("%8",Z1)),AN=$C($A(AM)-1),m("AB",Z1)=$E(SCH,1,m("%8",Z1)-1)_AN_$C(122) I SCH="" S m("AB",Z1)="-1",m("AC",Z1)="",m("%8",Z1)=1
 Q
DEC S LDEC=$L($P(SCH,".",2)),DEC=1 F ZZ=1:1:LDEC S DEC=DEC*10
 S DEC=1/DEC,m("AB",Z1)=SCH-DEC K DEC,LDEC,ZZ Q
C3(IFLAG) S IFLAG=0 K FRESU,AFRESU G L
FIN Q
GOLDNOM(RS,OLDNOM,OLDFULL) 
 D ^%VOLDNOM(RS,.OLDNOM,.OLDFULL) S m("OLDN")=OLDNOM,m("OLDF")=OLDFULL K OLDNOM,OLDFULL Q
RESAUTG(RS,SCR,RESUL) S ICCK=1 F ICC=1:1 Q:'($D(^%SCRE(SCR,ICC)))  I $D(^%SCRE(SCR,ICC))'=11 S RESUL(ICC)=$P(RS,"^",ICCK),ICCK=ICCK+1
 Q
RESLG(RS,SCR,RESUL) 
 D RES^%VKLONG Q
ISN(%PP) 
 S %PP1=%PP+0,%PP2=%PP1=%PP Q %PP2

