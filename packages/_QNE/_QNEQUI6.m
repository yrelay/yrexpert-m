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

;%QNEQUI6^INT^1^59547,73879^0
QNEQUI6(LLISTEN,C,CATT,EQUI,N,CMAX,MAXT,EQUIR,NTOT,EFTOT) 
 D INT(1,LLISTEN,C,CATT,.EQUI,.N,.CMAX,.MAXT,.EQUIR,.NTOT,.EFTOT)
 Q
INT(CONS,LLISTEN,C,CATT,EQUI,N,CMAX,MAXT,EQUIR,NTOT,EFTOT) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N ADR,I,L,STEMPSL,MINT,STEMPST,CARDL,MULT,TMPMOY
 S ADR=$$ADRLIS^%QSGEST7(LLISTEN)
 S (MAXT,MINT)=""
 S STEMPST=0
 S (EQUI,N,CMAX,EQUIR,NTOT,EFTOT)=0
 Q:(ADR="")!(ADR=0)
 
 S L=$O(@ADR@(""))
 F N=0:1 Q:L=""  D TR1 S L=$O(@ADR@(L))
 I N=0 Q
 
 I MINT=0 S MINT=1E-19
 I MAXT=0 S MAXT=1E-19
 S CMAX=$J((1-(MINT/MAXT))*100,0,5)
 
 S EQUI=$J((STEMPST/(N*C))*100,0,5)
 
 S EQUIR=$J((STEMPST/(N*MAXT))*100,0,5)
 I '(CONS) Q
 
 S L=$O(@ADR@(""))
 F I=0:0 Q:L=""  D CONSL S L=$O(@ADR@(L))
 I MINT=1E-19 S MINT=0
 I MAXT=1E-19 S MAXT=0
 Q
TR1 
 S STEMPSL=$$STEMPS(L,CATT,.CARDL)
 S MULT=$$^%QSCALVA("L0",L,"EFFECTIF.POSTE")
 I (MULT+0)<1 S MULT=1
 S TMPMOY=STEMPSL/MULT
 S STEMPST=STEMPST+TMPMOY
 S NTOT=NTOT+CARDL
 S EFTOT=EFTOT+MULT
 D PA^%QSGESTI("L0",L,CATT,$J(STEMPSL,0,5),1)
 D PA^%QSGESTI("L0",L,"TEMPS.PAR.OPERATEUR",$J(TMPMOY,0,5),1)
 I MAXT="" S MAXT=TMPMOY
 I MINT="" S MINT=TMPMOY
 S MAXT=$$MAX^%QZCA(MAXT,TMPMOY)
 S MINT=$$MIN^%QZCA(MINT,TMPMOY)
 Q
 
CONSL S MULT=$$^%QSCALVA("L0",L,"EFFECTIF.POSTE")
 I (MULT+0)<1 S MULT=1
 
 S STEMPSL=$$^%QSCALVA("L0",L,"TEMPS.PAR.OPERATEUR")
 D PA^%QSGESTI("L0",L,"CONCESSION",$J((1-(STEMPSL/MAXT))*100,0,5),CATT)
 Q
 
 
 
 
 
 
 
STEMPS(LISTE,CATT,I) 
 N ADR,SOMME,IND,BASE
 S SOMME=0,I=0
 S ADR=$$ADRLIS^%QSGEST7(LISTE)
 S BASE=$$BASE^%QSGEST7(LISTE)
 I ADR="" Q SOMME
 S IND=$O(@ADR@(""))
 F I=0:1 Q:IND=""  S SOMME=SOMME+$$^%QSCALVA(BASE,IND,CATT),IND=$O(@ADR@(IND))
 Q SOMME
 
 
EFFEC(ETUDE) 
 N ADR,EFF,LLISTEN,RETU,I
 S RETU=$$REP^%QNEQETU
 S LLISTEN=$$^%QSCALVA(RETU,ETUDE,"LISTE.POSTES")
 S EFF=0
 S ADR=$$ADRLIS^%QSGEST7(LLISTEN)
 I (ADR=0)!(ADR="") Q EFF
 S L=$O(@ADR@(""))
 F I=0:1 Q:L=""  D EFF1 S L=$O(@ADR@(L))
 Q EFF
EFF1 S EFF=EFF+$$^%QSCALVA("L0",L,"EFFECTIF.POSTE") Q
 
 
 
DISP(LISTIND,CATT,MIN,MAX,PAS) 
 N I,O,ADR,BASE
 S (MIN,MAX)=""
 S BASE=$$BASE^%QSGEST7(LISTIND)
 S ADR=$$ADRLIS^%QSGEST7(LISTIND)
 I (ADR="")!(ADR=0) D DISPF Q
 I (BASE="")!(BASE=0) D DISPF Q
 S O=$O(@ADR@(""))
 F I=0:0 Q:O=""  S A=$$^%QSCALVA(BASE,O,CATT),MIN=$S(MIN="":A,1:$$MIN^%QZCA(MIN,A)),MAX=$S(MAX="":A,1:$$MAX^%QZCA(MAX,A)),O=$O(@ADR@(O))
 D DISPF
 Q
DISPF I MIN="" S MIN=0
 I MAX="" S MAX=0
 
 S PAS=MAX/10
 I PAS=0 S PAS=1
 Q
TEST S LLISTEN="EQL88090490",C=80
 S CATT="TEMPS.FABRICATION"
 D QNEQUI6(LLISTEN,C,CATT,.EQUI,.N,.CMAX,.MAXT,.EQUIR)
 W !,"EQUI : ",EQUI,!,"N    : ",N
 W !,"CMAX : ",CMAX,!,"MAXT : ",MAXT
 W !,"EQUIR: ",EQUIR
 Q

