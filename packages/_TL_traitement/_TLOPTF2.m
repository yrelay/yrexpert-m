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

;%TLOPTF2^INT^1^59547,74030^0
%TLOPTF2 ;
 
 
 
 
 
 
 
 
TRIMESTR(IDEB,NBREG) 
 N RES
 S RES=$$^%QMDASAI(V(IDEB),.DA)
 S RES=$$^%QMDAFFI(DA,9)
 S TRIM=$P(RES,"/"),RES=$P(TRIM,"T",2)
 Q RES
 
 
 
 
 
 
 
 
MOIS(IDEB,NBREG) 
 N RES,MOI,DA
 S RES=$$^%QMDASAI(V(IDEB),.DA)
 S RES=$$^%QMDAFFI(DA,8)
 S MOI=$P(RES,"/"),RES=$P(MOI,"M",2)
 Q RES
 
 
 
 
 
 
 
 
SEMAINE(IDEB,NBREG) 
 N RES,SEM
 S RES=$$^%QMDASAI(V(IDEB),.DA)
 S RES=$$^%QMDAFFI(DA,6)
 S SEM=$P(RES,"/"),RES=$P(SEM,"S",2)
 Q RES
 
 
 
 
 
 
 
NETTOYER(IDEB,NBREG) 
 N RES
 S RES=$$GETLBLAN^%VTLBLAN(V(IDEB))
 Q RES
 
 
 
 
 
 
 
 
SSCHAINE(IDEB,NBREG) 
 N RES
 I NBREG=1 S RES=$E(V(IDEB)) Q RES
 I V(IDEB+1)=$C(0) S RES=$E(V(IDEB)) Q RES
 I NBREG=2 S RES=$E(V(IDEB),V(IDEB+1)) Q RES
 I V(IDEB+2)=$C(0) S RES=$E(V(IDEB),V(IDEB+1)) Q RES
 S RES=$E(V(IDEB),V(IDEB+1),V(IDEB+2)) Q RES
 
 
 
 
 
 
 
 
 
 
 
 
NOMINDLN(IDEB,NBREG) 
 N RES
 S RES=$$REFLIEN^%QSGES21(V(IDEB),V(IDEB+1),V(IDEB+2))
 Q RES
 
 
 
 
 
 
 
 
 
SYNONYME(IDEB,NBREG) 
 N RES
 I V(IDEB+1)=$C(0) S RES=$$S^%QAX(V(IDEB)) Q RES
 S RES=$$SC^%QAX(V(IDEB),V(IDEB+1)) Q RES
 Q RES
 
 
 
 
 
 
 
 
SUBSTITU(IDEB,NBREG) 
 N RES
 S RES=$$ZSUBST^%QZCHSUB(V(IDEB),V(IDEB+1),V(IDEB+2))
 Q RES
 
 
 
 
 
 
 
 
 
 
 
 
POURCENT(IDEB,NBREG) 
 N RES,GG
 S GG=V(IDEB)-V(IDEB+1)
 I GG<0 S GG=-(GG)
 I (GG/V(IDEB))'>V(IDEB+2) S RES=1 Q RES
 S RES=0
 Q RES
 
 
 
 
 
 
 
 
 
 
 
PASSENTR(IDEB,NBREG) 
 D ACTIV^LKMNTX0(MODAF,$S(V(IDEB)="SUITE.VALEURS":"EC",1:"PV"),V(IDEB+1),V(IDEB+2))
 Q 1
 
 
 
 
 
 
 
 
 
 
 
 
PASSSORT(IDEB,NBREG) 
 I V(IDEB)="ATTRIBUT.VALEUR" D ACTIV^LKXECRI(MODAF,V(IDEB+2),V(IDEB+3)) Q 1
 D ACTIV^LKYECRI(MODAF,V(IDEB+1),V(IDEB+2),V(IDEB+3)) Q 1
 Q 1
 ;

