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

;%TLQUERU^INT^1^59547,74031^0
%TLQUERU ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
MAJREP(TOTALE) 
 N NTRT,%NTRT
 D EMBRAYE^%TLQUER
 S NTRT=""
 F %NTRT=0:0 S NTRT=$O(^[QUI]TTL(NTRT)) Q:(NTRT="")!(NTRT="z")  D INDIV
 D DEBRAYE^%TLQUER
 Q
INDIV Q:$$EXISTE^%TLQUER(NTRT)&('(TOTALE))
 D:'($$EXISTE^%TLQUER(NTRT)) CREER^%TLQUER(NTRT),SETANA^%TLQUER3(NTRT,0)
 D MAJCOM^%TLQUER3(NTRT)
 D MAJ^%TLQUER2(NTRT,1,1,$$OKANA^%TLQUER3(NTRT))
 Q
 
 
 
 
 
 
MAJTLTL 
 D TTLTTL^%TLQUER2
 Q
 
 
 
 
 
MAJRTTL 
 D TRTTTL^%TLQUER2
 Q
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
SUBS(TTT,OLDCH,NEWCH,TYPE) 
 N GLOVAL,REGCOUR,I,LGOLD,LGNEW,I,J,PHRASE,ICOUR,FIN,A1,A2,P1,P2
 D EMBRAYE^%TLQUER
 S LGOLD=$L(OLDCH),LGNEW=$L(NEWCH)
 G:TYPE=2 SUBS2
 G:$$OKANA^%TLINTER(TTT) SUBS2
 ;;  Substitution d'une chaine/var temp et traitement bien analyse
 
 I '($$AIR^%QSGEST5("TRAITEMENT",TTT,OLDCH)) D DEBRAYE^%TLQUER Q
 
 
 
SUBS2 
 S GLOVAL="^[QUI]TTL("""_TTT_""",2)"
 
SSUBST S REGCOUR=""
 F I=0:0 S REGCOUR=$O(@GLOVAL@(REGCOUR)) Q:REGCOUR=""  D CHANGER
 S RESANA=$$^%TLIANAL(TTT,0)
 
 D DEBRAYE^%TLQUER
 Q
CHANGER 
 S PHRASE=^[QUI]TTL(TTT,2,REGCOUR),ICOUR="",FIN=0
 F J=0:0 S ICOUR=$O(@GLOVAL@(REGCOUR,ICOUR)) Q:ICOUR=""  D CHANGER2
 S ^[QUI]TTL(TTT,2,REGCOUR)=PHRASE
 Q
CHANGER2 
 S FIN=$F(PHRASE,OLDCH,FIN)
 S A1=$E(PHRASE,(FIN-LGOLD)-1,(FIN-LGOLD)-1),A2=$E(PHRASE,FIN,FIN)
 I TYPE=1 G:('($$SEPAR(A1)))!('($$SEPAR(A2))) CHANGER2
 S P1=$E(PHRASE,1,(FIN-LGOLD)-1),P2=$E(PHRASE,FIN,$L(PHRASE))
 S PHRASE=P1_NEWCH_P2,FIN=(FIN-LGOLD)+LGNEW
 Q
SEPAR(CARAC) 
 Q:(CARAC="")!("<>'!#()_-+=*[]&/\"[CARAC) 1
 Q 0
 
 
 
COHER N I,%I
 Q:'($$REPM^%QSGEST9("TRAITEMENT"))
 D EMBRAYE^%TLQUER
 S R="TRAITEMENT"
 S I="" F %I=0:0 S I=$$NXTRI^%QSTRUC8(R,I) Q:I=""  S TY=$E(I,1,2) D COH2
 S I="" F %I=0:0 S I=$O(^[QUI]TTL(I)) Q:I=""  D SIGNAL^%TLGEST(I)
 S I="" F %I=0:0 S I=$O(^[QUI]EDMOD(I)) Q:I=""  D SIGNAL^%EDDGEST(I)
 S I="" F %I=0:0 S I=$O(^[QUI]EDFORMAT(I)) Q:I=""  D SIGNAL^%EDFGEST(I)
 D DEBRAYE^%TLQUER
 Q
 
COH2 I TY="t." D SIGNAL^%TLGEST($E(I,3,$L(I))) Q
 I TY="m." D SIGNAL^%EDDGEST($E(I,3,$L(I))) Q
 I TY="f." D SIGNAL^%EDFGEST($E(I,3,$L(I))) Q
 D SUPP^%TLQUER(I) Q

