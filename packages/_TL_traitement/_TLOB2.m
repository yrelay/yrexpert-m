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

;%TLOB2^INT^1^59547,74030^0
%TLOB2 ;;06:56 PM  6 May 1992; ; 14 Jun 93  4:08 PM
 
 
 
 
 
 
NOM(IDEB,NBREG) 
 Q V(IDEB+1)
 
 
 
 
 
 
 
 
 
 
 
MODELE(IDEB,NBREG) 
 N ARRET S ARRET=0
 D EDIMOD^%TLIACT5(V(IDEB),V(IDEB+1),V(IDEB+2),V(IDEB+3))
 Q 1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
EL(IDEB,NBREG) 
 N REP
 I NBREG=6,V(IDEB+5)'=$C(0) G ELREP
 I V(IDEB) K CXT(V(IDEB+1))
 I V(IDEB+2)'=$C(0) D PSO^%QSGESTI(V(IDEB+3),V(IDEB+4),V(IDEB+1),V(IDEB+2))
 I V(IDEB+2)=$C(0) D PSV^%QSGESTI(V(IDEB+3),V(IDEB+4),V(IDEB+1))
 Q 1
ELREP I V(IDEB) Q 0
 S REP=$$NOMINT^%QSF(V(IDEB+5))
 I V(IDEB+2)=$C(0) D PKA^%QSGESTI(REP,V(IDEB+1)) Q 1
 D PKAN^%QSGESTI(REP,V(IDEB+1),V(IDEB+2)) Q 1
 Q 1
 
 
 
 
 
 
 
 
 
APPART(IDEB,NBREG) 
 I V(IDEB+1)=3 Q $D(@V(IDEB+2)@(V(IDEB)))
 I V(IDEB+1)=1 Q $$IR^%QSGE5(V(IDEB+2),V(IDEB))
 Q $$INLIS^%QS0XG2(V(IDEB+2),V(IDEB))
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
SAISIR(IDEB,NBREG) 
 N SAI,TYP,GLOSA,VAL,VALBID,RES,I,NBC,VALEUR,ABAND,NVAL,BID,TYPE
 S VAL=$$TEMP^%SGUTIL K @(VAL)
 S VALBID=$$TEMP^%SGUTIL K @(VALBID)
 S TYPE=V(IDEB),SAI=V(IDEB+1)
 S GLOSA=$$ADR^%SRCOMP(SAI)
 I $E(TYPE)=3 D ACT^%SRACTIV(SAI,0,GLOSA),CLEPAG^%VVIDEO G SAISFIN
 S NBC=@GLOSA@("NBC")
 S @VAL=$P(VALBID,")")
 X @GLOSA@("DEFAUT")
 I $E(TYPE)=2 F I=1:1:NBC S VALEUR=V((IDEB+1)+(I*5)) S:VALEUR'=$C(0) @VAL@(I)=VALEUR
 F I=1:1:NBC I '($D(@VAL@(I))) S @VAL@(I)=VALEUR
 I '($E(TYPE,2)) D CLEPAG^%VVIDEO
 
 D EXT^%PKSAISI(1,GLOSA,VAL,.POSS,.ABAND)
 I ABAND'=0 G SAISF12
 S I=1,TYP=@VALBID
 F I=1:1:NBC S RES=$P(TYP,$C(0),I) I RES'="" S BID=$$AFF^%TLOPT(V((IDEB+(I*5))-1),V(IDEB+(I*5)),V((IDEB+(I*5))-3),V((IDEB+(I*5))-2),RES)
SAISF12 I '($E(TYPE,3)) D CLEPAG^%VVIDEO
SAISFIN K @(VAL),@(VALBID)
 Q 1
 
 
 
 
 
 
 
 
 
 
 
DERNI(IDEB,NBREG) 
 N LISTVAL,VAL,TYP
 S LISTVAL=$$TEMP^%SGUTIL
 D MVG^%QSCALVA(V(IDEB+3),V(IDEB+4),V(IDEB+1),LISTVAL,.TYP)
 S VAL=$ZP(@LISTVAL@(""))
 K @(LISTVAL)
 Q VAL
 
 
 
 
 
 
 
 
 
 
PREMI(IDEB,NBREG) 
 N LISTVAL,VAL,TYP
 S LISTVAL=$$TEMP^%SGUTIL
 D MVG^%QSCALVA(V(IDEB+3),V(IDEB+4),V(IDEB+1),LISTVAL,.TYP)
 S VAL=$O(@LISTVAL@(""))
 K @(LISTVAL)
 Q VAL
 ;

