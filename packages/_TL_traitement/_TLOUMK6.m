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

;%TLOUMK6^INT^1^59547,74030^0
%TLOUMK6 ;;12:04 PM  5 Nov 1992; ; 07 Jun 93  4:43 PM
 
 
 
 
 
 
 
 s ^%COMPIL("$TRAITERL",1)="D INSER(""S DEROUT=6,PAREXE(""""IEL"""")=""_(ICCOUR+3))"
 s ^%COMPIL("$TRAITERL",2)="S IELCAL=IELCAL+1 D PUSH(IELCAL) D INSER(""S DEROUT=1,PAREXE(""""IEL"""")=""_$C(179)_IELCAL_$C(179))"
 s ^%COMPIL("$TRAITERL",3)="D COMPIL(I+3,^[QUI]ANSA(X,1)) D INSER(""S:'$$EXITRT^%TLOPTM(V(""_(I+3)_"")) DEROUT=999"") D COMPIL(I+4,^[QUI]ANSA(X,2)) D INSER(""S:'$$EXILIS^%TLOPTM(V(""_(I+4)_"")) DEROUT=999"")"
 s ^%COMPIL("$TRAITERL",4)="D INSER(""S V(""_(I+2)_"")=$$BASEL^%TLOPTM(V(""_(I+4)_""))"") D INSER(""S V(""_I_"")=$$PREML^%TLOPTM(V(""_(I+4)_""))"")"
 s ^%COMPIL("$TRAITERL",5)="D PUSH(ICCOUR+1) D INSER(""S:V(""_I_"")="""""""" DEROUT=3"")"
 s ^%COMPIL("$TRAITERL",6)="D INSER(""S V(""_(I+1)_"")=$$ORDXL^%TLOPTM(V(""_(I+4)_""),V(""_I_""))"")"
 s ^%COMPIL("$TRAITERL",7)="D INSER(""S DEROUT=2,PAREXE(""""REP"""")=V(""_(I+2)_""),PAREXE(""""IND"""")=V(""_I_""),PAREXE(""""TRT"""")=V(""_(I+3)_""),PAREXE(""""REG"""")=1,PAREXE(""""IEL"""")=1,PAREXE(""""LIS"""")=V(""_(I+4)_"")"")"
 s ^%COMPIL("$TRAITERL",8)="D INSER(""S V(""_I_"")=$$SUIVXL^%TLOPTM(V(""_(I+4)_""),V(""_I_""),V(""_(I+1)_""))"") D INSER(""S DEROUT=1,PAREXE(""""IEL"""")=""_$$PULL()_"""")"
 s ^%COMPIL("$TRAITERL",9)="S IELCAL($$PULL())=ICCOUR+1 D INSER("""")"
 
 
 
 
 
 s ^%COMPIL("$POURVAL",1)="D INSER(""S DEROUT=7,PAREXE(""""IEL"""")=""_(ICCOUR+3))"
 s ^%COMPIL("$POURVAL",2)="S IELCAL=IELCAL+1 D PUSH(IELCAL) D INSER(""S DEROUT=1,PAREXE(""""IEL"""")=""_$C(179)_IELCAL_$C(179))"
 s ^%COMPIL("$POURVAL",3)="D COMPIL(I,^[QUI]ANSA(X,4)) D INSER(""S V(""_I_"")=$$GETLIGE^%TLOGCMP(V(""_I_"")) S:V(""_I_"")="""""""" DEROUT=999"")"
 s ^%COMPIL("$POURVAL",4)="D COMPADR(I+3,^[QUI]ANSA(X,1)),COMPADR(I+7,^[QUI]ANSA(X,2)),COMPADR(I+11,^[QUI]ANSA(X,3))"
 s ^%COMPIL("$POURVAL",5)="D INSER(""S V(""_(I+1)_"")=$$PREMORD^%TLOPTM(V(""_(I+13)_""),V(""_(I+14)_""),V(""_(I+11)_""))"")"
 s ^%COMPIL("$POURVAL",6)="D PUSH(ICCOUR+1) D INSER(""S:V(""_(I+1)_"")="""""""" DEROUT=3"")"
 s ^%COMPIL("$POURVAL",7)="D INSER(""S V(""_(I+2)_"")=$$AFF^%TLOPTM(V(""_(I+9)_""),V(""_(I+10)_""),V(""_(I+7)_""),V(""_(I+8)_""),V(""_(I+1)_""))"")"
 s ^%COMPIL("$POURVAL",8)="D INSER(""S V(""_(I+2)_"")=$$GET^%TLOPTM(V(""_(I+13)_""),V(""_(I+14)_""),V(""_(I+11)_""),V(""_(I+1)_""))"")"
 s ^%COMPIL("$POURVAL",9)="D INSER(""S V(""_(I+2)_"")=$$AFF^%TLOPTM(V(""_(I+5)_""),V(""_(I+6)_""),V(""_(I+3)_""),V(""_(I+4)_""),V(""_(I+2)_""))"")"
 s ^%COMPIL("$POURVAL",10)="D INSER(""S DEROUT=2,PAREXE(""""REG"""")=V(""_I_""),PAREXE(""""IEL"""")=1"")"
 s ^%COMPIL("$POURVAL",11)="D INSER(""S V(""_(I+1)_"")=$$ORDSV^%TLOPTM(V(""_(I+13)_""),V(""_(I+14)_""),V(""_(I+11)_""),V(""_(I+1)_""))"")"
 s ^%COMPIL("$POURVAL",12)="D INSER(""S DEROUT=1,PAREXE(""""IEL"""")=""_$$PULL()_"""")"
 s ^%COMPIL("$POURVAL",13)="S IELCAL($$PULL())=ICCOUR+1 D INSER("""")"
 q
 ;

