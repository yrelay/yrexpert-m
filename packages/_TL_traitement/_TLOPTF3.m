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

;%TLOPTF3^INT^1^59547,74030^0
%TLOPTF3 ;
 
 
 
 
 
 
 
 
PARTIE(IVDEB,NBPAR) 
 N RES
 I V(IVDEB+2)=$C(0) S RES=$P(V(IVDEB),V(IVDEB+1)) Q RES
 I V(IVDEB+3)=$C(0) S RES=$P(V(IVDEB),V(IVDEB+1),V(IVDEB+2)) Q RES
 S RES=$P(V(IVDEB),V(IVDEB+1),V(IVDEB+2),V(IVDEB+3))
 Q RES
 
 
 
 
 
 
 
TROUVER(IVDEB,NBPAR) 
 N RES
 I V(IVDEB+2)=$C(0) S RES=$F(V(IVDEB),V(IVDEB+1)) Q RES
 I V(IVDEB+3)=$C(0) S RES=$F(V(IVDEB),V(IVDEB+1),V(IVDEB+2)) Q RES
 
 
 
 
 
 
 
JUSTIFIE(IVDEB,NBPAR) 
 N RES
 I V(IVDEB+2)=$C(0) S RES=$J(V(IVDEB),V(IVDEB+1)) Q RES
 Q $J(V(IVDEB),V(IVDEB+1),V(IVDEB+2))
 
 
 
 
 
 
 
MAJUSCUL(IVDEB,NBPAR) 
 N RES
 S RES=$$MAJ^%VMINUSC(V(IVDEB))
 Q RES
 
 
 
 
 
 
 
MINUSCUL(IVDEB,NBPAR) 
 N RES
 S RES=$$MIN^%VMINUSC(V(IVDEB))
 Q RES
 
 
 
 
 
 
 
 
 
 
 
 
ACQU(IDEB,NBREG) 
 N NOMINT
 
 S NOMINT=V(IDEB)
 I NBREG=3 Q:$$OAIR^%QSGE5(NOMINT,V(IDEB+1),V(IDEB+2),1) $$^%QSCALIN(NOMINT,V(IDEB+1),V(IDEB+2),1) Q $$^%QSCALVA(NOMINT,V(IDEB+1),V(IDEB+2))
 I (V(IDEB+3)=$C(0))&$$OAIR^%QSGE5(NOMINT,V(IDEB+1),V(IDEB+2),1) Q $$^%QSCALIN(NOMINT,V(IDEB+1),V(IDEB+2),1)
 I V(IDEB+3)=$C(0) Q $$^%QSCALVA(NOMINT,V(IDEB+1),V(IDEB+2))
 Q $$^%QSCALIN(NOMINT,V(IDEB+1),V(IDEB+2),V(IDEB+3))
 
 
 
 
 
 
 
 
 
POPER(IDEB,NBREG) 
 N RES
 I (V(IDEB)=1)&(V(IDEB+1)=$C(0)) S RES=$$GEN^%QCAPOP("") Q RES
 I V(IDEB)=1 S RES=$$GEN^%QCAPOP(V(IDEB+1)) Q RES
 I V(IDEB+1)=$C(0) S RES=$$GLOB^%QCAPOP("^[QUI]CPTEUR(""POP"")") Q RES
 I V(IDEB)=3 Q $$12NC^%QCAPOP(V(IDEB+1))
 S RES=V(IDEB+1)_$$GLOB^%QCAPOP("^[QUI]CPTEUR("""_V(IDEB+1)_""")")
 Q RES
 
 
 
 
 
 
 
 
 
 
 
MAJOR(IDEB,NBREG) 
 N RES,NB,I,J
 S RES=V(IDEB),NB=NBREG-1
 F I=1:1:NB I V(IDEB+I)>RES S RES=V(IDEB+1) Q
 F J=I:1:NB I (V(IDEB+J)<RES)&(V(IDEB+J)'<V(IDEB)) S RES=V(IDEB+J)
 Q RES
 
 
 
 
 
 
 
 
 
VALEURL(IDEB,NBREG) 
 N RES
 S RES=$$GEN^%QCAPOP("VAL")
 D EXTR^%QS0VALE(V(IDEB),V(IDEB+1),RES)
 Q RES
 
 
 
 
 
 
 
 
COPIERL(IDEB,NBREG) 
 N RES
 S RES=$$GEN^%QCAPOP("DUP")
 D DUPL^%QS0DUPL(V(IDEB),RES,.R)
 Q RES
 ;
 ;

