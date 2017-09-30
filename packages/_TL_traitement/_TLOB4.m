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

;%TLOB4^INT^1^59547,74030^0
%TLOB4 ;;05:43 PM  18 May 1992; ; 10 Sep 93  9:57 AM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
COPIER(IDEB,NBREG) 
 N VARTR,TYP,REPTR,NOM1,NOM2,REP,IND,ATT,ORD,KILL
 N WHOIS1,WHOIS2,REP1,IND1,IND2,QUI1,QUI2,OR2,RES
 N DEFR,DEFI,LISTE
 S KILL=MODEX'=1
 S TYP=V(IDEB)
 S VARTR=$S((TYP=1)!(TYP=3):V(IDEB+1),1:V(IDEB+5))
 S REP1=$$NOMLOG^%QSF(V(IDEB+6))
 S IND1=V(IDEB+7)
 S IND2=V(IDEB+8)
 G:TYP=1 COPHIE
 G:TYP=3 COPLIEN
 
 S DEFR=REP1,DEFI=IND1,LISTE=IND2
 S RES='($$DIAREC^%QMCPT(VARTR))
 Q 1
 
COPHIE S OR2=V(IDEB+9)
 S WHOIS2=$S(V(IDEB+10)=$C(0):WHOIS,V(IDEB+10)="":WHOIS,1:V(IDEB+10))
 S QUI2=^TABIDENT(WHOIS2,"MACHINE")
 S RES=$$DIACONT^%QMCPT
 D ^%QMCP9(WHOIS1,QUI1,BASE1,IND1,WHOIS2,QUI2,IND2,OR2)
 S R=$$AJCXT^%TLOPT(VARTR,BASE1,IND2)
 Q 1
COPLIEN 
 S OR2=V(IDEB+9)
 D RECOP^%QSGES25(V(IDEB+6),IND1,IND2,OR2,1)
 S R=$$AJCXT^%TLOPT(VARTR,V(IDEB+6),IND2)
 Q 1
 
 
 
 
 
 
 
 
 
REMPLACE(IDEB,NBREG) 
 Q $$REMPLACE^%QSGES28(V(IDEB),V(IDEB+1),V(IDEB+2))
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
AJDEL(IDEB,NBREG) 
 N ATTRI,REP,DAT,NBJ,REG,VAL,ERR
 S ATTRI=V(IDEB),REP=V(IDEB+2),DAT=V(IDEB+4)
 S NBJ=V(IDEB+5)
 S REG=$S(V(IDEB+6)=$C(0):"",1:V(IDEB+6))
 S DAT=$$INTF^%QMDAUC(REP,ATTRI,DAT)
 S DAT=$P(DAT,"/")
 S VAL=$$ADDJOUR^%QMDRUTI(DAT,NBJ,.REG,.ERR)
 S VAL=$$AFFI^%QMDAUC(REP,ATTRI,VAL)
 Q VAL
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
RETDEL(IDEB,NBREG) 
 N ATTRI,REP,DAT,NBJ,REG,VAL,ERR
 S ATTRI=V(IDEB),REP=V(IDEB+2),DAT=V(IDEB+4),NBJ=V(IDEB+5)
 S REG=$S(V(IDEB+6)=$C(0):"",1:V(IDEB+6))
 S DAT=$$INTF^%QMDAUC(REP,ATTRI,DAT)
 S DAT=$P(DAT,"/")
 S VAL=$$RETJOUR^%QMDRUTI(DAT,NBJ,.REG,.ERR)
 S VAL=$$AFFI^%QMDAUC(REP,ATTRI,VAL)
 Q VAL
 
 
 
 
 
 
 
 
 
 
TRANSTD(IDEB,NBREG) 
 N LAT,LISTTD
 S LAT=V(IDEB)
 S LISTTD=V(IDEB+1)
 D SAUVVAL^%TLUTIL
 D ^TORQYT(LAT,LISTTD),CLEPAG^%VVIDEO
 D RESTVAL^%TLUTIL
 Q 1
 ;

