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

;%TLOA1^INT^1^59547,74030^0
%TLOA1 ;;04:51 PM  13 Oct 1992; ; 08 Sep 93 10:00 AM
 
 
 
 
 
 
 
AJOUTL(IDEB,NBREG) 
 Q:'($$EX^%QSGEST7(V(IDEB))) 0
 D AJOUT^%QS0XG1(V(IDEB),V(IDEB+1))
 Q 1
 
 
 
 
 
 
 
 
RETIRL(IDEB,NBREG) 
 Q:'($$EX^%QSGEST7(V(IDEB))) 0
 D RETIRL^%QS0XG1(V(IDEB),V(IDEB+1))
 Q 1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
ATTRIB(IDEB,NBREG) 
 N ORD
 D:'($$EXIST^%LXSTOCK(V(IDEB+2))) MOT^%LXSTOCK(V(IDEB+2))
 S ORD=$S(V(IDEB+4)=$C(0):1,1:V(IDEB+4))
 D PA^%QSGESTI(V(IDEB),V(IDEB+1),V(IDEB+2),V(IDEB+3),ORD)
 Q 1
 
 
 
 
 
 
 
 
 
 
 
 
 
COMPL(IDEB,NBREG) 
 N LIST,ADRES,ADRES2,RES
 S LIST=V(IDEB)
 S ADRES=$$^%QSCALVA("L0",LIST,"ADRESSE")
 S ADRES2=$S(V(IDEB+1)=$C(0):$$LISTIND^%QSGEST6($$^%QSCALVA("L0",LIST,"BASE")),1:$$^%QSCALVA("L0",V(IDEB+1),"ADRESSE"))
 S ADRES=$$COMPL^%QS0COMP(LIST,ADRES,ADRES2,.RES) Q RES
 
 
 
 
 
 
 
UNION(IDEB,NBREG) 
 N TEMPOL,VIL,NVL,IL,%I
 S TEMPOL=$$TEMP^%SGUTIL
 F IL=1:1:NBREG S @TEMPOL@(V((IDEB+IL)-1))=""
 S NVL=$$GEN^%QCAPOP("ZUN")
 D:WHOIS("ETUDE")=0 UNION^%QS0CALC(TEMPOL,NVL)
 
 D:WHOIS("ETUDE")'=0 UNIETU^%QS0CALC(TEMPOL,NVL)
 S IL="" F %I=0:0 S IL=$O(@TEMPOL@(IL)) Q:IL=""  D USE^%QS0(IL)
 K @(TEMPOL)
 Q NVL
 
 
 
 
 
 
 
INTERS(IDEB,NBREG) 
 N TEMPOL,NVL,IL,%I
 S TEMPOL=$$TEMP^%SGUTIL
 F IL=1:1:NBREG S @TEMPOL@(V((IDEB+IL)-1))=""
 S NVL=$$GEN^%QCAPOP("ZIN")
 D INTERSECT^%QS0CALC(TEMPOL,NVL)
 D:WHOIS("ETUDE")=0 INTERSECT^%QS0CALC(TEMPOL,NVL)
 
 D:WHOIS("ETUDE")'=0 INTETU^%QS0CALC(TEMPOL,NVL)
 S IL="" F %I=0:0 S IL=$O(@TEMPOL@(IL)) Q:IL=""  D USE^%QS0(IL)
 K @(TEMPOL)
 Q NVL
 ;

